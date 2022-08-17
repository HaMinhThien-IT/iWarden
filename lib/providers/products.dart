import 'dart:convert';
import 'package:flutter/material.dart';
import 'product.dart';
import 'package:http/http.dart' as http;
import '../models/http_exception.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    // Product(
    //   id: 'p1',
    //   title: 'Goku ultra instinct',
    //   description: 'A red shirt - it is pretty red!',
    //   price: 29.99,
    //   imageUrl:
    //       'https://toigingiuvedep.vn/wp-content/uploads/2022/03/anh-nen-songoku-wallpaper-dep-820x387.jpg',
    // ),
    // Product(
    //   id: 'p2',
    //   title: 'Black Goku ultra instinct',
    //   description: 'A nice pair of trousers.',
    //   price: 59.99,
    //   imageUrl:
    //       'https://toigingiuvedep.vn/wp-content/uploads/2022/03/hinh-anh-nen-songoku-sieu-ngau-820x513.jpg',
    // ),
    // Product(
    //   id: 'p3',
    //   title: 'Vegeto blue',
    //   description: 'Warm and cozy - exactly what you need for the winter.',
    //   price: 19.99,
    //   imageUrl:
    //       'https://truongquochoc.com/wp-content/uploads/2020/10/chiem-nguong-hinh-nen-7-vien-ngoc-rong-cho-dien-thoai-voi-cac-nhan-vat-an-tuong-16.jpg',
    // ),
    // Product(
    //   id: 'p4',
    //   title: 'Goteta blue',
    //   description: 'Prepare any meal you want.',
    //   price: 49.99,
    //   imageUrl:
    //       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgZ2bk6-c_8sqWvcrDUo-yJ8NW8E8DwqsZgpfYn5OglAxgANTFm1FbQ6usjBPmKMCBWwQ&usqp=CAU',
    // ),
  ];
  List<Product> get favoriteItems {
    return _items.where((element) => element.isFavorite).toList();
  }

  late final String authToken;
  late final String userId;
  Products(this.authToken, this.userId, this._items);
  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((item) => item.id == id);
  }

  Future<void> fetchAndSetProducts([bool filterByUser = false]) async {
    final filterString =
        filterByUser ? 'orderBy="creatorId"&equalTo="$userId"' : '';
    var url = Uri.parse(
        'https://shop-app-t02-default-rtdb.asia-southeast1.firebasedatabase.app/products.json?auth=$authToken&$filterString');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      url = Uri.parse(
          'https://shop-app-t02-default-rtdb.asia-southeast1.firebasedatabase.app/userFavortites/$userId.json?auth=$authToken');
      final favoriteResponse = await http.get(url);
      final favoriteData = json.decode(favoriteResponse.body);
      final List<Product> loadedProducts = [];
      extractedData.forEach((proId, prodData) {
        loadedProducts.add(Product(
            id: proId,
            description: prodData['description'],
            imageUrl: prodData['imageUrl'],
            price: prodData['price'],
            title: prodData['title'],
            isFavorite:
                favoriteData == null ? false : favoriteData[proId] ?? false));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> addProduct(Product product) async {
    final url = Uri.parse(
        'https://shop-app-t02-default-rtdb.asia-southeast1.firebasedatabase.app/products.json?auth=$authToken');
    await http
        .post(url,
            body: json.encode({
              'title': product.title,
              'description': product.description,
              'price': product.price,
              'imageUrl': product.imageUrl,
              'creatorId': userId
            }))
        .then((res) {
      final newProduct = Product(
        id: json.decode(res.body)['name'],
        title: product.title,
        description: product.description,
        imageUrl: product.imageUrl,
        price: product.price,
      );
      _items.add(newProduct);
      notifyListeners();
    }).catchError((err) {
      throw err;
    });

    // _items.insert(0, newProduct);
  }

  Future<void> updateProduct(String id, Product newProduct) async {
    final productIndex = _items.indexWhere((element) => element.id == id);

    if (productIndex >= 0) {
      final url = Uri.parse(
          'https://shop-app-t02-default-rtdb.asia-southeast1.firebasedatabase.app/products/${id}.json?auth=$authToken');
      await http.patch(url,
          body: json.encode({
            'title': newProduct.title,
            'description': newProduct.description,
            'price': newProduct.price,
            'imageUrl': newProduct.imageUrl,
            'isFavorite': newProduct.isFavorite
          }));
      _items[productIndex] = newProduct;
      notifyListeners();
    }
  }

  Future<void> deleteProduct(String id) async {
    final url = Uri.parse(
        'https://shop-app-t02-default-rtdb.asia-southeast1.firebasedatabase.app/products/${id}.json?auth=$authToken');
    final existingProductIndex =
        _items.indexWhere((element) => element.id == id);
    Product? existingProduct = _items[existingProductIndex];

    _items.removeAt(existingProductIndex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, existingProduct as Product);
      notifyListeners();
      throw HttpException(message: 'Could not delete product.');
    }
    existingProduct = null;
  }
}
