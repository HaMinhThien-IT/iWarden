import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iWarden/providers/locations.dart';
import 'package:iWarden/providers/print_issue_providers.dart';
import 'package:iWarden/screens/aborting_screen.dart';
import 'package:iWarden/screens/issue_pcn_first_seen.dart';
import 'package:iWarden/screens/abort-screen/abort_screen.dart';
import 'package:iWarden/screens/add-first-seen/add_first_seen_screen.dart';
import 'package:iWarden/screens/first-seen/detail_first_seen.dart';
import 'package:iWarden/screens/home_overview.dart';
import 'package:iWarden/screens/location/location_screen.dart';
import 'package:iWarden/screens/login_screens.dart';
import 'package:iWarden/screens/map-screen/map_screen.dart';
import 'package:iWarden/screens/print_issue.dart' as print;
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/theme.dart';
import 'package:provider/provider.dart';
import '../routes/routes.dart';
import 'package:anyline_plugin/anyline_plugin.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: ColorTheme.backdrop2),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Locations(),
        ),
        ChangeNotifierProvider.value(
          value: PrintIssueProviders(),
        ),
      ],
      child: MaterialApp(
        title: 'iWarden',
        theme: themeMain(),
        debugShowCheckedModeBanner: false,
        home: const AddFirstSeenScreen(),
        initialRoute: AddFirstSeenScreen.routeName,
        routes: routes,
      ),
    );
  }
}
