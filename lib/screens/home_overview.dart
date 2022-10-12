import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iWarden/screens/first-seen/add-first-seen/add_first_seen_screen.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';

import 'package:iWarden/widgets/app_bar.dart';
import 'package:iWarden/widgets/drawer/info_drawer.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';
import 'package:iWarden/widgets/home/card_home.dart';

class HomeOverview extends StatelessWidget {
  static const routeName = '/home';
  const HomeOverview({Key? key}) : super(key: key);
  // ignore: unused_element
  Future<void> _showMyDialog(
      BuildContext context, String title, String subTitle, Widget func) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      barrierColor: ColorTheme.backdrop,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AlertDialog(
            insetPadding: const EdgeInsets.all(20),
            contentPadding: EdgeInsets.zero,
            title: Text(
              title,
              style: CustomTextStyle.h4,
              textAlign: TextAlign.center,
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    subTitle,
                    style:
                        CustomTextStyle.h5.copyWith(color: ColorTheme.grey600),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 16,
                  )
                ],
              ),
            ),
            actions: <Widget>[
              Center(
                child: func,
              ),
              const SizedBox(
                height: 4,
              )
            ],
          ),
        );
      },
    );
  }

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
              name: "Tom Smiths",
              location: "London",
              zone: "Car park 1",
            ),
            const SizedBox(
              height: 10,
            ),
            CardHome(
              width: width,
              assetIcon: "assets/svg/IconFirstSeen.svg",
              backgroundIcon: ColorTheme.lighterPrimary,
              title: "First seen",
              desc:
                  "First seen list description First seen list description description",
              infoRight: "Active: 12",
              infoLeft: "Expired: 12",
              route: AddFirstSeenScreen.routeName,
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
              route: AddFirstSeenScreen.routeName,
            ),
            const SizedBox(
              height: 10,
            ),
            CardHome(
              width: width,
              assetIcon: "assets/svg/IconCharges2.svg",
              backgroundIcon: ColorTheme.lighterSecondary,
              title: "Parking Charges",
              desc:
                  "Parking charges list description Parking charges list description",
              infoRight: "Issued: 12",
              infoLeft: "Aborted: 12",
              route: AddFirstSeenScreen.routeName,
            ),
          ],
        ),
      ),
    );
  }
}
