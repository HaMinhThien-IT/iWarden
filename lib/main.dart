import 'package:flutter/material.dart';
import 'package:iwarden/screens/HomeOverview.dart';
import 'package:iwarden/theme/theme.dart';

import '../routes/routes.dart';
import '../screens/login_screens.dart';
import '../theme/color.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop',
      theme: themeMain(),
      debugShowCheckedModeBanner: false,
      home: const HomeOverview(),
      routes: routes,
    );
  }
}
