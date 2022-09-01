import 'package:flutter/material.dart';
import 'package:iWarden/theme/color.dart';

import 'package:iWarden/widgets/appBar.dart';
import 'package:iWarden/widgets/drawer/InfoDrawer.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';
import 'package:iWarden/widgets/home/CardHome.dart';

class HomeOverview extends StatelessWidget {
  static const routerName = '/home';
  const HomeOverview({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const MyAppBar(title: "Home"),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            const InfoDrawer(
                isDrawer: false,
                assetImage:
                    "https://i.pinimg.com/originals/4d/86/5e/4d865ea47a8675d682ff35ad904a0af6.png",
                email: "tom.smiths@ukparkingcontrol.com",
                name: "Tom Smiths"),
            const SizedBox(
              height: 10,
            ),
            CardHome(
              width: width,
              assetIcon: "assets/svg/IconFirstSeen.svg",
              backgroundIcon: ColorTheme.lightPrimary,
              title: "First seen",
              desc:
                  "First seen list description First seen list description description",
              infoRight: "Active: 12",
              infoLeft: "Expired: 12",
            ),
            const SizedBox(
              height: 10,
            ),
            CardHome(
              width: width,
              assetIcon: "assets/svg/IconGrace.svg",
              backgroundIcon: ColorTheme.lightDanger,
              title: "Grace period",
              desc:
                  "Grace period list description Grace period list description...",
              infoRight: "Active: 12",
              infoLeft: "Expired: 12",
            ),
            const SizedBox(
              height: 10,
            ),
            CardHome(
              width: width,
              assetIcon: "assets/svg/IconCharges.svg",
              backgroundIcon: ColorTheme.lightSecondary,
              title: "Parking Charges",
              desc:
                  "Parking charges list description Parking charges list description",
              infoRight: "Issued: 12",
              infoLeft: "Aborted: 12",
            )
          ],
        ),
      ),
    );
  }
}
