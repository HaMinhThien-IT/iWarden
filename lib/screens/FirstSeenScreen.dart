import 'package:flutter/material.dart';
import 'package:iWarden/common/CardItem.dart';
import 'package:iWarden/common/Tabbar.dart';
import 'package:iWarden/config/const.dart';
import 'package:iWarden/screens/DetailFirstSeen.dart';
import 'package:iWarden/theme/color.dart';

class FirstSeenScreen extends StatelessWidget {
  static const routerName = '/first-seen';
  const FirstSeenScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return MyTabBar(
      titleAppBar: "First seen",
      funcAdd: () {},
      funcRefresh: () {},
      tabBarViewTab1: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.width < 400
                ? 0
                : ConstSpacing.bottom),
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
              route: DetailFirstSeen.routerName,
            ),
            CardItem(
              currentIndexTab: 0,
              width: width,
              title: "bd5i smr".toUpperCase(),
              desc:
                  "Grace period list description Grace period list description...",
              infoRight: "Active: 12",
              infoLeft: "Expired: 12",
              route: DetailFirstSeen.routerName,
            ),
            CardItem(
              currentIndexTab: 0,
              width: width,
              title: "bd5i smr".toUpperCase(),
              desc:
                  "Grace period list description Grace period list description...",
              infoRight: "Active: 12",
              infoLeft: "Expired: 12",
              route: DetailFirstSeen.routerName,
            ),
            CardItem(
              currentIndexTab: 0,
              width: width,
              title: "bd5i smr".toUpperCase(),
              desc:
                  "Grace period list description Grace period list description...",
              infoRight: "Active: 12",
              infoLeft: "Expired: 12",
              route: DetailFirstSeen.routerName,
            ),
            CardItem(
              currentIndexTab: 0,
              width: width,
              title: "bd5i smr".toUpperCase(),
              desc:
                  "Grace period list description Grace period list description...",
              infoRight: "Active: 12",
              infoLeft: "Expired: 12",
              route: DetailFirstSeen.routerName,
            ),
            CardItem(
              currentIndexTab: 0,
              width: width,
              title: "bd5i smr".toUpperCase(),
              desc:
                  "Grace period list description Grace period list description...",
              infoRight: "Active: 12",
              infoLeft: "Expired: 12",
              route: DetailFirstSeen.routerName,
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
              route: routerName,
            ),
            CardItem(
              currentIndexTab: 1,
              width: width,
              title: "bd5i smr".toUpperCase(),
              desc:
                  "Grace period list description Grace period list description...",
              infoRight: "Active: 12",
              infoLeft: "Expired: 12",
              route: routerName,
            ),
            CardItem(
              currentIndexTab: 1,
              width: width,
              title: "bd5i smr".toUpperCase(),
              desc:
                  "Grace period list description Grace period list description...",
              infoRight: "Active: 12",
              infoLeft: "Expired: 12",
              route: routerName,
            ),
            CardItem(
              currentIndexTab: 1,
              width: width,
              title: "bd5i smr".toUpperCase(),
              desc:
                  "Grace period list description Grace period list description...",
              infoRight: "Active: 12",
              infoLeft: "Expired: 12",
              route: routerName,
            ),
            CardItem(
              currentIndexTab: 1,
              width: width,
              title: "bd5i smr".toUpperCase(),
              desc:
                  "Grace period list description Grace period list description...",
              infoRight: "Active: 12",
              infoLeft: "Expired: 12",
              route: routerName,
            ),
            CardItem(
              currentIndexTab: 1,
              width: width,
              title: "bd5i smr".toUpperCase(),
              desc:
                  "Grace period list description Grace period list description...",
              infoRight: "Active: 12",
              infoLeft: "Expired: 12",
              route: routerName,
            ),
          ],
        ),
      )),
      quantityActive: 12,
      quantityExpired: 15,
    );
  }
}
