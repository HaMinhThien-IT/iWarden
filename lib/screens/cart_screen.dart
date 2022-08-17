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
                        OrderButton(cart: cart),
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

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  State<OrderButton> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: widget.cart.totalAmount < 1 || _isLoading
            ? null
            : () async {
                setState(() {
                  _isLoading = true;
                });
                await Provider.of<Orders>(context, listen: false).addOrder(
                    widget.cart.items.values.toList(), widget.cart.totalAmount);
                widget.cart.clear();
                setState(() {
                  _isLoading = false;
                });
                // Navigator.of(context)
                //     .pushReplacementNamed(OrderScreen.routeName);
              },
        child: _isLoading
            ? const CircularProgressIndicator()
            : const Text('Order now!'));
  }
}
