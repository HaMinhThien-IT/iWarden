import 'package:flutter/material.dart';
import 'package:iWarden/screens/abort-screen/abort_screen.dart';
import 'package:iWarden/screens/connecting_screen.dart';
import 'package:iWarden/screens/first-seen/add-first-seen/add_first_seen_screen.dart';
import 'package:iWarden/screens/first-seen/active_detail_first_seen.dart';
import 'package:iWarden/screens/first-seen/active_first_seen_screen.dart';
import 'package:iWarden/screens/first-seen/expired_detail_first_seen.dart';
import 'package:iWarden/screens/grace-period/add_grace_period.dart';
import 'package:iWarden/screens/grace-period/index.dart';
import 'package:iWarden/screens/home_overview.dart';
import 'package:iWarden/screens/location/location_screen.dart';
import 'package:iWarden/screens/parking-charges/issue_pcn_first_seen.dart';
import 'package:iWarden/screens/parking-charges/parking_charge_detail.dart';
import 'package:iWarden/screens/parking-charges/preview_photo.dart';
import 'package:iWarden/screens/parking-charges/print_pcn.dart';
import 'package:iWarden/screens/parking-charges/parking_charge_list.dart';
import 'package:iWarden/screens/parking-charges/print_issue.dart';
import 'package:iWarden/screens/read_regulation_screen.dart';
import 'package:iWarden/screens/send_form_screen.dart';
import 'package:iWarden/screens/statictis_screen.dart';
import '../screens/login_screens.dart';

final Map<String, WidgetBuilder> routes = {
  HomeOverview.routeName: (context) => const HomeOverview(),
  LocationScreen.routeName: (context) => const LocationScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  // GracePeriodScreen.routeName: (context) => const GracePeriodScreen(),
  // ParkingChargesScreen.routeName: (context) => const GracePeriodScreen(),
  // first seen
  ActiveFirstSeenScreen.routeName: (context) => const ActiveFirstSeenScreen(),
  DetailActiveFirstSeen.routeName: (context) => const DetailActiveFirstSeen(),
  //parking charge
  IssuePCNFirstSeenScreen.routeName: (context) =>
      const IssuePCNFirstSeenScreen(),
  PrintPCN.routeName: (context) => const PrintPCN(),
  PreviewPhoto.routeName: (context) => const PreviewPhoto(),

  ParkingChargeDetail.routeName: (context) => const ParkingChargeDetail(),
  AddFirstSeenScreen.routeName: (context) => const AddFirstSeenScreen(),
  PrintIssue.routeName: (context) => const PrintIssue(),
  AbortScreen.routeName: (context) => const AbortScreen(),
  DetailExpiredFirstSeen.routeName: (context) => const DetailExpiredFirstSeen(),
  ParkingChargeList.routeName: (context) => const ParkingChargeList(),
  GracePeriodList.routeName: (context) => const GracePeriodList(),
  AddGracePeriod.routeName: (context) => const AddGracePeriod(),
  StatisticScreen.routeName: (context) => const StatisticScreen(),
  SendFormScreen.routeName: (context) => const SendFormScreen(),
  ConnectingScreen.routeName: (context) => const ConnectingScreen(),
  ReadRegulationScreen.routeName: (context) => const ReadRegulationScreen()
};
