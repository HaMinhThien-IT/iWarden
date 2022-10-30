import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/common/bottom_sheet_2.dart';
import 'package:iWarden/common/motion_toast.dart';
import 'package:iWarden/common/my_dialog.dart';
import 'package:iWarden/screens/first-seen/active_first_seen_screen.dart';
import 'package:iWarden/screens/first-seen/add-first-seen/add_first_seen_screen.dart';
import 'package:iWarden/screens/grace-period/add_grace_period.dart';
import 'package:iWarden/screens/grace-period/index.dart';
import 'package:iWarden/screens/parking-charges/issue_pcn_first_seen.dart';
import 'package:iWarden/screens/parking-charges/parking_charge_list.dart';
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

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const MyAppBar(title: "Home"),
      drawer: const MyDrawer(),
      bottomSheet: BottomSheet2(buttonList: [
        BottomNavyBarItem(
            onPressed: () {
              MotionToast.success(
                title: const Text(
                  'Updated successfully',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                description: const Text(
                  "",
                  style: TextStyle(fontSize: 12),
                ),
                layoutOrientation: ToastOrientation.ltr,
                position: MotionToastPosition.bottom,
                animationType: AnimationType.fromLeft,
                dismissable: false,
                animationDuration: const Duration(milliseconds: 200),
                animationCurve: Curves.decelerate,
                toastDuration: const Duration(milliseconds: 1500),
                borderRadius: 5,
              ).show(context);
            },
            icon: SvgPicture.asset("assets/svg/IconPrinter.svg"),
            label: const Text(
              "Start lunch",
              style: CustomTextStyle.h6,
            )),
        BottomNavyBarItem(
            onPressed: () {},
            icon: SvgPicture.asset("assets/svg/CheckOut.svg"),
            label: Text(
              "End shift",
              style: CustomTextStyle.h6.copyWith(color: ColorTheme.danger),
            )),
      ]),
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
              location: "Castlepoint Shopping centre",
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
              routeView: ActiveFirstSeenScreen.routeName,
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
              route: AddGracePeriod.routeName,
              routeView: GracePeriodList.routeName,
            ),
            const SizedBox(
              height: 10,
            ),
            CardHome(
              width: width,
              assetIcon: "assets/svg/IconParkingChargesHome.svg",
              backgroundIcon: ColorTheme.lighterSecondary,
              title: "Parking Charges",
              desc:
                  "Parking charges list description Parking charges list description",
              infoRight: "Issued: 12",
              infoLeft: null,
              route: IssuePCNFirstSeenScreen.routeName,
              routeView: ParkingChargeList.routeName,
            ),
          ],
        ),
      ),
    );
  }
}
