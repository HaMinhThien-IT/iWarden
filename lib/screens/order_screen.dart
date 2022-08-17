import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import '../widgets/order_item.dart';
import '../providers/order.dart';

class OrderScreen extends StatefulWidget {
  static const routeName = '/orders';

  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  late Future _ordersFuture;
  Future _obtainOrdersFuture() {
    return Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
  }

  @override
  void initState() {
    _ordersFuture = _obtainOrdersFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final orders = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xff00bcd4), Color(0xff2196f3)],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          )),
        ),
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
          future: _ordersFuture,
          builder: (ctx, item) {
            if (item.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (item.error != null) {
                return const Center(
                  child: Text('An error occurred'),
                );
              } else {
                return Consumer<Orders>(
                    builder: (ctx, orderDate, child) => ListView.builder(
                          itemBuilder: (context, index) =>
                              OrderItemWidget(order: orderDate.orders[index]),
                          itemCount: orderDate.orders.length,
                        ));
              }
            }
          }),
    );
  }
}
