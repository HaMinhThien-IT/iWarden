import 'package:flutter/material.dart';

class CartItem {
  String id;
  final String title;
  int quantity;
  final double price;
  final String imageUrl;
  CartItem(
      {required this.id,
      required this.price,
      required this.quantity,
      required this.title,
      required this.imageUrl});
}

class Cart with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items == null ? 0 : _items.length;
  }

  void addToCart(CartItem cartItem) {
    if (_items.containsKey(cartItem.id)) {
      _items.update(
          cartItem.id,
          (value) => CartItem(
              id: value.id,
              price: value.price,
              quantity: value.quantity + 1,
              title: value.title,
              imageUrl: value.imageUrl));
    } else {
      cartItem.id = DateTime.now().toString();

      _items.putIfAbsent(cartItem.id, () => cartItem);
    }
  }
}
