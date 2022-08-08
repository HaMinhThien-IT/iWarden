import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
          Card(
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
                    label: Text('\$${cart.totalAmount.toString()}',
                        style: const TextStyle(color: Colors.white)),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  TextButton(onPressed: () {}, child: const Text('Order now!'))
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
