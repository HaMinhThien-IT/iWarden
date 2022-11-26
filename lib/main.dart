import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iWarden/configs/configs.dart';
import 'package:iWarden/core/services/api.dart';
import 'package:iWarden/providers/auth.dart';
import 'package:iWarden/providers/contraventions.dart';
import 'package:iWarden/providers/vehicle_info.dart';
import 'package:iWarden/providers/locations.dart';
import 'package:iWarden/providers/print_issue_providers.dart' as print_pro;
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

import 'package:iWarden/screens/parking-charges/parking_charge_list.dart';
import 'package:iWarden/screens/parking-charges/print_issue.dart' as pr;
import 'package:iWarden/screens/read_regulation_screen.dart';
import 'package:iWarden/screens/statictis_screen.dart';
import 'package:iWarden/settings/app_settings.dart';
import 'package:iWarden/theme/theme.dart';
import 'package:provider/provider.dart';
import '../routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Locations()),
        ChangeNotifierProvider.value(value: print_pro.PrintIssueProviders()),
        ChangeNotifierProvider.value(value: Auth()),
        ChangeNotifierProvider.value(value: VehicleInfo()),
        ChangeNotifierProvider.value(value: Contraventions()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    final appSetting = AppSettings();
    appSetting.settings();

    return MaterialApp(
      title: 'iWarden',
      theme: themeMain(),
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigatorKey,
      home: FutureBuilder(
        future: _fbApp,
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            print('You have an error! ${snapshot.error.toString()}');
            return const Text('Something went wrong!');
          } else if (snapshot.hasData) {
            return Consumer<Auth>(
              builder: (ctx, auth, _) =>
                  auth.isAuth ? const LocationScreen() : const LocationScreen(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
      routes: routes,
    );
  }
}

// void main() => runApp(
//       MultiProvider(
//         providers: [
//           ChangeNotifierProvider.value(value: Locations()),
//           ChangeNotifierProvider.value(value: PrintIssueProviders()),
//         ],
//         child: const MyApp(),
//       ),
//     );

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     // final appSetting = AppSettings();
//     // appSetting.settings();

//     return MaterialApp(
//       title: 'iWarden',
//       theme: themeMain(),
//       debugShowCheckedModeBanner: false,
//       home: const LocationScreen(),
//       initialRoute: LocationScreen.routeName,
//       routes: routes,
//     );
//   }
// }