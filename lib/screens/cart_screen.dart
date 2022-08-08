import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/order.dart';
import 'package:shop_app/screens/order_screen.dart';
import 'package:shop_app/widgets/cart_item.dart';
import '../providers/cart.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final orders = Provider.of<Orders>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart!')),
      body: Column(
        children: <Widget>[
          cart.itemCount < 1
              ? Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    'Cart is empty !',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              : Card(
                  margin: const EdgeInsets.all(15),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          'Total',
                          style: TextStyle(fontSize: 20),
                        ),
                        const Spacer(),
                        const SizedBox(
                          width: 10,
                        ),
                        Chip(
                          label: Text(
                              '\$${cart.totalAmount.toStringAsFixed(2)}',
                              style: const TextStyle(color: Colors.white)),
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        TextButton(
                            onPressed: () {
                              orders.addOrder(
                                  cart.items.values.toList(), cart.totalAmount);
                              cart.clear();
                              Navigator.of(context)
                                  .pushReplacementNamed(OrderScreen.routeName);
                            },
                            child: const Text('Order now!'))
                      ],
                    ),
                  ),
                ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (ctx, index) => CartItemWidget(
              cartItem: cart.items.values.toList()[index],
              productId: cart.items.keys.toList()[index],
            ),
            itemCount: cart.items.length,
          ))
        ],
      ),
    );
  }
}
