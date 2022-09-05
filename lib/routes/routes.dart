import 'package:flutter/material.dart';
import 'package:iWarden/screens/DetailFirstSeen.dart';
import 'package:iWarden/screens/FirstSeenScreen.dart';
import 'package:iWarden/screens/GracePeriodScreen.dart';
import 'package:iWarden/screens/HomeOverview.dart';
import 'package:iWarden/screens/ParkingChargesScreen.dart';
import '../screens/login_screens.dart';

final Map<String, WidgetBuilder> routes = {
  HomeOverview.routerName: (context) => const HomeOverview(),
  LoginScreen.routerName: (context) => const LoginScreen(),
  FirstSeenScreen.routerName: (context) => const FirstSeenScreen(),
  GracePeriodScreen.routerName: (context) => const GracePeriodScreen(),
  ParkingChargesScreen.routerName: (context) => const GracePeriodScreen(),
  DetailFirstSeen.routerName: (context) => const DetailFirstSeen()
};
