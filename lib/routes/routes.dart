import 'package:flutter/material.dart';
import 'package:iWarden/screens/DetailFirstSeen.dart';
import 'package:iWarden/screens/FirstSeenScreen.dart';
import 'package:iWarden/screens/GracePeriodScreen.dart';
import 'package:iWarden/screens/HomeOverview.dart';
import 'package:iWarden/screens/LocationScreen.dart';
import 'package:iWarden/screens/IssuePCNFirstSeen.dart';
import 'package:iWarden/screens/ParkingChargesScreen.dart';
import '../screens/login_screens.dart';

final Map<String, WidgetBuilder> routes = {
  HomeOverview.routerName: (context) => const HomeOverview(),
  LocationScreen.routeName: (context) => const LocationScreen(),
  LoginScreen.routerName: (context) => const LoginScreen(),
  GracePeriodScreen.routerName: (context) => const GracePeriodScreen(),
  ParkingChargesScreen.routerName: (context) => const GracePeriodScreen(),
  // first seen
  FirstSeenScreen.routerName: (context) => const FirstSeenScreen(),
  DetailFirstSeen.routerName: (context) => const DetailFirstSeen(),
  IssuePCNFirstSeenScreen.routerName: (context) =>
      const IssuePCNFirstSeenScreen()
};
