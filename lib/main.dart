import 'package:flutter/material.dart';
import 'package:iWarden/screens/HomeOverview.dart';
import 'package:iWarden/theme/theme.dart';

import '../routes/routes.dart';
import '../screens/login_screens.dart';
import '../theme/color.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iWarden',
      theme: themeMain(),
      debugShowCheckedModeBanner: false,
      home: const HomeOverview(),
      routes: routes,
    );
  }
}
