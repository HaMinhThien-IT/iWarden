import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';
import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  // final Product product;
  static const routerName = '/product-detail';
  const ProductDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final Product loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
        appBar: AppBar(
      title: Text(loadedProduct.title),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xff00bcd4), Color(0xff2196f3)],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        )),
      ),
    ));
  }
}
