import 'package:flutter/material.dart';
import 'product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Goku ultra instinct',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://toigingiuvedep.vn/wp-content/uploads/2022/03/anh-nen-songoku-wallpaper-dep-820x387.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Black Goku ultra instinct',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://toigingiuvedep.vn/wp-content/uploads/2022/03/hinh-anh-nen-songoku-sieu-ngau-820x513.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Vegeto blue',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://truongquochoc.com/wp-content/uploads/2020/10/chiem-nguong-hinh-nen-7-vien-ngoc-rong-cho-dien-thoai-voi-cac-nhan-vat-an-tuong-16.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Goteta blue',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgZ2bk6-c_8sqWvcrDUo-yJ8NW8E8DwqsZgpfYn5OglAxgANTFm1FbQ6usjBPmKMCBWwQ&usqp=CAU',
    ),
  ];
  List<Product> get favoriteItems {
    return _items.where((element) => element.isFavorite).toList();
  }

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((element) => element.isFavorite).toList();
    // }
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((item) => item.id == id);
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
