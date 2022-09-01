import 'package:flutter/material.dart';
import 'package:iWarden/screens/FirstSeenScreen.dart';
import 'package:iWarden/screens/HomeOverview.dart';
import '../screens/login_screens.dart';

final Map<String, WidgetBuilder> routes = {
  HomeOverview.routerName: (context) => const HomeOverview(),
  LoginScreen.routerName: (context) => const LoginScreen(),
  FirstSeenScreen.routerName: (context) => const FirstSeenScreen()
};
