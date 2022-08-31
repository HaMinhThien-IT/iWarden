import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/textTheme.dart';

import 'package:iWarden/widgets/appBar.dart';
import 'package:iWarden/widgets/drawer/InfoDrawer.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';

class HomeOverview extends StatelessWidget {
  static const routerName = '/home';
  const HomeOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            SizedBox(
              height: 10,
            ),
            InfoDrawer(
                isDrawer: false,
                assetImage:
                    "https://i.pinimg.com/originals/4d/86/5e/4d865ea47a8675d682ff35ad904a0af6.png",
                email: "tom.smiths@ukparkingcontrol.com",
                name: "Tom Smiths"),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
