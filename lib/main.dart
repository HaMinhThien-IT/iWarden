import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iWarden/providers/locations.dart';
import 'package:iWarden/providers/print_issue_providers.dart';
import 'package:iWarden/screens/connecting_screen.dart';
import 'package:iWarden/screens/first-seen/active_first_seen_screen.dart';
import 'package:iWarden/screens/parking-charges/issue_pcn_first_seen.dart';
import 'package:iWarden/screens/abort-screen/abort_screen.dart';
import 'package:iWarden/screens/first-seen/add-first-seen/add_first_seen_screen.dart';
import 'package:iWarden/screens/first-seen/active_detail_first_seen.dart';
import 'package:iWarden/screens/home_overview.dart';
import 'package:iWarden/screens/location/location_screen.dart';
import 'package:iWarden/screens/login_screens.dart';
import 'package:iWarden/screens/map-screen/map_screen.dart';
import 'package:iWarden/screens/parking-charges/print_pcn.dart';
import 'package:iWarden/screens/parking-charges/parking_charge_list.dart';
import 'package:iWarden/screens/parking-charges/print_issue.dart' as print;
import 'package:iWarden/screens/read_regulation_screen.dart';
import 'package:iWarden/screens/statictis_screen.dart';
import 'package:iWarden/settings/app_settings.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/theme.dart';
import 'package:provider/provider.dart';
import '../routes/routes.dart';
import 'package:anyline_plugin/anyline_plugin.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: Locations()),
          ChangeNotifierProvider.value(value: PrintIssueProviders()),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final appSetting = AppSettings();
    // appSetting.settings();

    return MaterialApp(
      title: 'iWarden',
      theme: themeMain(),
      debugShowCheckedModeBanner: false,
      home: const LocationScreen(),
      initialRoute: LocationScreen.routeName,
      routes: routes,
    );
  }
}
