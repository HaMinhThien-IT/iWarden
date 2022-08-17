import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/products_overview_screen.dart';
import '../screens/auth_screen.dart';
import '../providers/auth.dart';
import './screens/edit_product_screen.dart';
import './screens/user_product_screen.dart';
import './providers/order.dart';
import './screens/product_detail_screen.dart';
import './screens/cart_screen.dart';
import './providers/products.dart';
import './screens/order_screen.dart';
import './providers/cart.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Auth(),
          ),
          ChangeNotifierProxyProvider<Auth, Products>(
            create: (_) => Products('', '', []),
            update: (context, value, previous) => Products(value.token ?? '',
                value.userId, previous == null ? [] : previous.items),
          ),
          ChangeNotifierProvider.value(
            value: Cart(),
          ),
          ChangeNotifierProxyProvider<Auth, Orders>(
            create: (_) => Orders([], '', ''),
            update: (context, value, previous) => Orders(
                previous == null ? [] : previous.orders,
                value.userId,
                value.token ?? ''),
          )
        ],
        child: Consumer<Auth>(
          builder: (context, auth, _) => MaterialApp(
            title: 'MyShop',
            theme: ThemeData(
                colorScheme: ColorScheme.fromSwatch().copyWith(
                  primary: const Color(0xff00bcd4),
                  secondary: Colors.cyan[50],
                ),
                textTheme: ThemeData.light().textTheme.copyWith(
                      titleMedium: const TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                      titleLarge: const TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                fontFamily: 'Lato'),
            home: auth.isAuth
                ? const ProductsOverviewScreen()
                : const AuthScreen(),
            routes: {
              ProductDetailScreen.routerName: (ctx) =>
                  const ProductDetailScreen(),
              CartScreen.routeName: (ctx) => const CartScreen(),
              OrderScreen.routeName: (ctx) => const OrderScreen(),
              UserProductScreen.routeName: (ctx) => const UserProductScreen(),
              EditProductScreen.routeName: (ctx) => const EditProductScreen()
            },
          ),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Episode Releases'),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
      ),
      body: const Center(
        child: Text('Let\'s build a shop!'),
      ),
    );
  }
}
