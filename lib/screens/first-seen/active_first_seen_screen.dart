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
    return MyTabBar(
      labelFuncAdd: "Add first seen",
      titleAppBar: "First seen",
      funcAdd: () {
        Navigator.of(context).pushNamed(AddFirstSeenScreen.routeName);
      },
      funcRefresh: refresh,
      tabBarViewTab1: RefreshIndicator(
        onRefresh: refresh,
        child: SingleChildScrollView(
            child: Container(
          margin: const EdgeInsets.only(bottom: ConstSpacing.bottom),
          child: Column(
            children: [0, 1, 2, 3, 4, 5]
                .map(
                  (e) => CardItem(
                    type: TypeFirstSeen.Active,
                    title: "bd5i smr",
                    expiring: DateTime.now(),
                    visited: DateTime.now(),
                    route: DetailActiveFirstSeen.routeName,
                  ),
                )
                .toList(),
          ),
        )),
      ),
      tabBarViewTab2: RefreshIndicator(
        onRefresh: refresh,
        child: SingleChildScrollView(
            child: Container(
          margin: const EdgeInsets.only(bottom: ConstSpacing.bottom),
          child: Column(
            children: [0, 1, 2, 3, 5]
                .map(
                  (e) => CardItem(
                    type: TypeFirstSeen.Expired,
                    title: "bd5i smr",
                    expiring: DateTime.now(),
                    visited: DateTime.now(),
                    route: DetailExpiredFirstSeen.routeName,
                  ),
                )
                .toList(),
          ),
        )),
      ),
      quantityActive: 12,
      quantityExpired: 15,
    );
  }
}
