import 'package:flutter/material.dart';
import 'package:iWarden/screens/AbortingScreen.dart';
import 'package:iWarden/screens/DetailFirstSeen.dart';
import 'package:iWarden/screens/HomeOverview.dart';
import 'package:iWarden/screens/LocationScreen.dart';
import 'package:iWarden/screens/login_screens.dart';
import 'package:iWarden/theme/theme.dart';
import '../routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iWarden',
      theme: themeMain(),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
      initialRoute: LoginScreen.routeName,
      routes: routes,
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(builder: (ctx) => const DetailFirstSeen());
      // },
    );
  }
}
