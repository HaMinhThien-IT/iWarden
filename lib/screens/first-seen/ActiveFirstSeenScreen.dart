import 'package:flutter/material.dart';
import 'package:iWarden/common/CardItem.dart';
import 'package:iWarden/common/Tabbar.dart';
import 'package:iWarden/configs/const.dart';
import 'package:iWarden/screens/DetailFirstSeen.dart';
import 'package:iWarden/theme/color.dart';

class ActiveFirstSeenScreen extends StatelessWidget {
  static const routeName = '/first-seen';
  const ActiveFirstSeenScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return MyTabBar(
      titleAppBar: "First seen",
      funcAdd: () {},
      funcRefresh: () {},
      tabBarViewTab1: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.only(bottom: ConstSpacing.bottom),
        child: Column(
          children: [
            CardItem(
              currentIndexTab: 0,
              width: width,
              title: "bd5i smr".toUpperCase(),
              desc:
                  "Grace period list description Grace period list description...",
              infoRight: "Active: 12",
              infoLeft: "Expired: 12",
              route: DetailFirstSeen.routeName,
            ),
            CardItem(
              currentIndexTab: 0,
              width: width,
              title: "bd5i smr".toUpperCase(),
              desc:
                  "Grace period list description Grace period list description...",
              infoRight: "Active: 12",
              infoLeft: "Expired: 12",
              route: DetailFirstSeen.routeName,
            ),
            CardItem(
              currentIndexTab: 0,
              width: width,
              title: "bd5i smr".toUpperCase(),
              desc:
                  "Grace period list description Grace period list description...",
              infoRight: "Active: 12",
              infoLeft: "Expired: 12",
              route: DetailFirstSeen.routeName,
            ),
            CardItem(
              currentIndexTab: 0,
              width: width,
              title: "bd5i smr".toUpperCase(),
              desc:
                  "Grace period list description Grace period list description...",
              infoRight: "Active: 12",
              infoLeft: "Expired: 12",
              route: DetailFirstSeen.routeName,
            ),
            CardItem(
              currentIndexTab: 0,
              width: width,
              title: "bd5i smr".toUpperCase(),
              desc:
                  "Grace period list description Grace period list description...",
              infoRight: "Active: 12",
              infoLeft: "Expired: 12",
              route: DetailFirstSeen.routeName,
            ),
            CardItem(
              currentIndexTab: 0,
              width: width,
              title: "bd5i smr".toUpperCase(),
              desc:
                  "Grace period list description Grace period list description...",
              infoRight: "Active: 12",
              infoLeft: "Expired: 12",
              route: DetailFirstSeen.routeName,
            ),
          ],
        ),
      )),
      tabBarViewTab2: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.width < 400
                ? 0
                : ConstSpacing.bottom),
        child: Column(
          children: [
            CardItem(
              currentIndexTab: 1,
              width: width,
              title: "bd5i smr".toUpperCase(),
              desc:
                  "Grace period list description Grace period list description...",
              infoRight: "Active: 12",
              infoLeft: "Expired: 12",
              route: routeName,
            ),
            CardItem(
              currentIndexTab: 1,
              width: width,
              title: "bd5i smr".toUpperCase(),
              desc:
                  "Grace period list description Grace period list description...",
              infoRight: "Active: 12",
              infoLeft: "Expired: 12",
              route: routeName,
            ),
            CardItem(
              currentIndexTab: 1,
              width: width,
              title: "bd5i smr".toUpperCase(),
              desc:
                  "Grace period list description Grace period list description...",
              infoRight: "Active: 12",
              infoLeft: "Expired: 12",
              route: routeName,
            ),
            CardItem(
              currentIndexTab: 1,
              width: width,
              title: "bd5i smr".toUpperCase(),
              desc:
                  "Grace period list description Grace period list description...",
              infoRight: "Active: 12",
              infoLeft: "Expired: 12",
              route: routeName,
            ),
            CardItem(
              currentIndexTab: 1,
              width: width,
              title: "bd5i smr".toUpperCase(),
              desc:
                  "Grace period list description Grace period list description...",
              infoRight: "Active: 12",
              infoLeft: "Expired: 12",
              route: routeName,
            ),
            CardItem(
              currentIndexTab: 1,
              width: width,
              title: "bd5i smr".toUpperCase(),
              desc:
                  "Grace period list description Grace period list description...",
              infoRight: "Active: 12",
              infoLeft: "Expired: 12",
              route: routeName,
            ),
          ],
        ),
      )),
      quantityActive: 12,
      quantityExpired: 15,
    );
  }
}
