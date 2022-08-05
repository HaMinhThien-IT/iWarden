import 'package:flutter/material.dart';
import '../widgets/products_grid.dart';
import '../providers/product.dart';

class ProductsOverviewScreen extends StatelessWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xff00bcd4), Color(0xff2196f3)],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          )),
        ),
      ),
      body: const ProductsGrid(),
    );
  }
}
