import 'package:flutter/material.dart';
import 'package:iWarden/screens/aborting_screen.dart';
import 'package:iWarden/screens/add-first-seen/add_first_seen_screen.dart';
import 'package:iWarden/screens/first-seen/detail_first_seen.dart';
import 'package:iWarden/screens/first-seen/active_first_seen_screen.dart';
import 'package:iWarden/screens/grace_period_screen.dart';
import 'package:iWarden/screens/home_overview.dart';
import 'package:iWarden/screens/location/location_screen.dart';
import 'package:iWarden/screens/issue_pcn_first_seen.dart';
import 'package:iWarden/screens/parking_charges_screen.dart';
import 'package:iWarden/screens/print_issue.dart';
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
  AddFirstSeenScreen.routeName: (context) => const AddFirstSeenScreen(),
  PrintIssue.routeName: (context) => const PrintIssue(),
};
