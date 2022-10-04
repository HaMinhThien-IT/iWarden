import 'package:flutter/material.dart';
import 'package:iWarden/screens/AbortingScreen.dart';
import 'package:iWarden/screens/add-first-seen/AddFirstSeenScreen.dart';
import 'package:iWarden/screens/first-seen/DetailFirstSeen.dart';
import 'package:iWarden/screens/first-seen/ActiveFirstSeenScreen.dart';
import 'package:iWarden/screens/GracePeriodScreen.dart';
import 'package:iWarden/screens/HomeOverview.dart';
import 'package:iWarden/screens/location/LocationScreen.dart';
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
  ActiveFirstSeenScreen.routeName: (context) => const ActiveFirstSeenScreen(),
  DetailFirstSeen.routeName: (context) => const DetailFirstSeen(),
  IssuePCNFirstSeenScreen.routeName: (context) =>
      const IssuePCNFirstSeenScreen(),
  AbortingScreen.routeName: (context) => const AbortingScreen(),
  AddFirstSeenScreen.routeName: (context) => const AddFirstSeenScreen()
};
