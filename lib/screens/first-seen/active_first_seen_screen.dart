import 'package:flutter/material.dart';
import 'package:iWarden/common/card_item.dart';
import 'package:iWarden/common/tabbar.dart';
import 'package:iWarden/configs/const.dart';
import 'package:iWarden/models/first_seen.dart';
import 'package:iWarden/screens/first-seen/add-first-seen/add_first_seen_screen.dart';
import 'package:iWarden/screens/first-seen/active_detail_first_seen.dart';
import 'package:iWarden/screens/first-seen/expired_detail_first_seen.dart';

class ActiveFirstSeenScreen extends StatelessWidget {
  static const routeName = '/first-seen';
  const ActiveFirstSeenScreen({Key? key}) : super(key: key);
  Future refresh() async {}
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return MyTabBar(
      titleAppBar: "First seen",
      funcAdd: () {
        Navigator.of(context).pushNamed(AddFirstSeenScreen.routeName);
      },
      funcRefresh: () {},
      tabBarViewTab1: RefreshIndicator(
        onRefresh: refresh,
        child: SingleChildScrollView(
            child: Container(
          margin: const EdgeInsets.only(bottom: ConstSpacing.bottom),
          child: Column(
            children: [
              CardItem(
                type: TypeFirstSeen.Active,
                title: "bd5i smr".toUpperCase(),
                expiring: DateTime.now(),
                visited: DateTime.now(),
                route: DetailActiveFirstSeen.routeName,
              ),
              CardItem(
                type: TypeFirstSeen.Active,
                title: "bd5i smr".toUpperCase(),
                expiring: DateTime.now(),
                visited: DateTime.now(),
                route: DetailActiveFirstSeen.routeName,
              ),
              CardItem(
                type: TypeFirstSeen.Active,
                title: "bd5i smr".toUpperCase(),
                expiring: DateTime.now(),
                visited: DateTime.now(),
                route: DetailActiveFirstSeen.routeName,
              ),
              CardItem(
                type: TypeFirstSeen.Active,
                title: "bd5i smr".toUpperCase(),
                expiring: DateTime.now(),
                visited: DateTime.now(),
                route: DetailActiveFirstSeen.routeName,
              ),
              CardItem(
                type: TypeFirstSeen.Active,
                title: "bd5i smr".toUpperCase(),
                expiring: DateTime.now(),
                visited: DateTime.now(),
                route: DetailActiveFirstSeen.routeName,
              ),
              CardItem(
                type: TypeFirstSeen.Active,
                title: "bd5i smr".toUpperCase(),
                expiring: DateTime.now(),
                visited: DateTime.now(),
                route: DetailActiveFirstSeen.routeName,
              ),
            ],
          ),
        )),
      ),
      tabBarViewTab2: RefreshIndicator(
        onRefresh: refresh,
        child: SingleChildScrollView(
            child: Container(
          margin: const EdgeInsets.only(bottom: ConstSpacing.bottom),
          child: Column(
            children: [
              CardItem(
                type: TypeFirstSeen.Expired,
                title: "bd5i smr".toUpperCase(),
                expiring: DateTime.now(),
                visited: DateTime.now(),
                route: DetailExpriedFirstSeen.routeName,
              ),
              CardItem(
                type: TypeFirstSeen.Expired,
                title: "bd5i smr".toUpperCase(),
                expiring: DateTime.now(),
                visited: DateTime.now(),
                route: DetailExpriedFirstSeen.routeName,
              ),
              CardItem(
                type: TypeFirstSeen.Expired,
                title: "bd5i smr".toUpperCase(),
                expiring: DateTime.now(),
                visited: DateTime.now(),
                route: DetailExpriedFirstSeen.routeName,
              ),
              CardItem(
                type: TypeFirstSeen.Expired,
                title: "bd5i smr".toUpperCase(),
                expiring: DateTime.now(),
                visited: DateTime.now(),
                route: DetailExpriedFirstSeen.routeName,
              ),
              CardItem(
                type: TypeFirstSeen.Expired,
                title: "bd5i smr".toUpperCase(),
                expiring: DateTime.now(),
                visited: DateTime.now(),
                route: DetailExpriedFirstSeen.routeName,
              ),
              CardItem(
                type: TypeFirstSeen.Expired,
                title: "bd5i smr".toUpperCase(),
                expiring: DateTime.now(),
                visited: DateTime.now(),
                route: DetailExpriedFirstSeen.routeName,
              ),
            ],
          ),
        )),
      ),
      quantityActive: 12,
      quantityExpired: 15,
    );
  }
}
