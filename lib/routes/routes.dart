import 'package:flutter/material.dart';
import 'package:iwarden/screens/HomeOverview.dart';
import '../screens/login_screens.dart';

final Map<String, WidgetBuilder> routes = {
  HomeOverview.routerName: (context) => const HomeOverview(),
  LoginScreen.routerName: (context) => const LoginScreen()
};
