import 'package:flutter/material.dart';
import 'package:iWarden/screens/DetailFirstSeen.dart';
import 'package:iWarden/screens/HomeOverview.dart';
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
      home: const HomeOverview(),
      initialRoute: HomeOverview.routerName,
      routes: routes,
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(builder: (ctx) => const DetailFirstSeen());
      // },
    );
  }
}
