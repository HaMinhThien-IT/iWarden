import 'package:flutter/material.dart';
import 'package:iWarden/screens/AbortingScreen.dart';
import 'package:iWarden/screens/DetailFirstSeen.dart';
import 'package:iWarden/screens/FirstSeenScreen.dart';
import 'package:iWarden/screens/GracePeriodScreen.dart';
import 'package:iWarden/screens/HomeOverview.dart';
import 'package:iWarden/screens/LocationScreen.dart';
import 'package:iWarden/screens/IssuePCNFirstSeen.dart';
import 'package:iWarden/screens/IssuePCNFirstSeen.dart';
import 'package:iWarden/screens/ParkingChargesScreen.dart';
import '../screens/login_screens.dart';

final Map<String, WidgetBuilder> routes = {
  HomeOverview.routeName: (context) => const HomeOverview(),
  LocationScreen.routeName: (context) => const LocationScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  GracePeriodScreen.routeName: (context) => const GracePeriodScreen(),
  ParkingChargesScreen.routeName: (context) => const GracePeriodScreen(),
  // first seen
  FirstSeenScreen.routeName: (context) => const FirstSeenScreen(),
  DetailFirstSeen.routeName: (context) => const DetailFirstSeen(),
  IssuePCNFirstSeenScreen.routeName: (context) =>
      const IssuePCNFirstSeenScreen(),
  AbortingScreen.routeName: (context) => const AbortingScreen()
};
