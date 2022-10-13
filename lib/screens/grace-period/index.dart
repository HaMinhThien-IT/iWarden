import 'package:flutter/material.dart';
import 'package:iWarden/common/card_item.dart';
import 'package:iWarden/common/tabbar.dart';
import 'package:iWarden/configs/const.dart';
import 'package:iWarden/models/first_seen.dart';
import 'package:iWarden/screens/first-seen/active_detail_first_seen.dart';
import 'package:iWarden/screens/first-seen/expired_detail_first_seen.dart';
import 'package:iWarden/screens/grace-period/add_grace_period.dart';

class GracePeriodList extends StatelessWidget {
  static const routeName = '/grace-period-list';
  const GracePeriodList({super.key});
  Future refreshDataActive() async {}
  Future refreshDataExpired() async {}
  @override
  Widget build(BuildContext context) {
    return MyTabBar(
      labelFuncAdd: "Add grace period",
      titleAppBar: "Grace period",
      quantityActive: 12,
      quantityExpired: 12,
      funcAdd: () {
        Navigator.of(context).pushNamed(AddGracePeriod.routeName);
      },
      funcRefresh: () {},
      tabBarViewTab1: RefreshIndicator(
        onRefresh: refreshDataActive,
        child: SingleChildScrollView(
            child: Container(
          margin: const EdgeInsets.only(bottom: ConstSpacing.bottom),
          child: Column(
            children: [
              CardItem(
                type: TypeFirstSeen.Active,
                title: "bd5i smr",
                expiring: DateTime.now(),
                visited: DateTime.now(),
                route: DetailActiveFirstSeen.routeName,
              ),
              CardItem(
                type: TypeFirstSeen.Active,
                title: "bd5i smr",
                expiring: DateTime.now(),
                visited: DateTime.now(),
                route: DetailActiveFirstSeen.routeName,
              ),
              CardItem(
                type: TypeFirstSeen.Active,
                title: "bd5i smr",
                expiring: DateTime.now(),
                visited: DateTime.now(),
                route: DetailActiveFirstSeen.routeName,
              ),
              CardItem(
                type: TypeFirstSeen.Active,
                title: "bd5i smr",
                expiring: DateTime.now(),
                visited: DateTime.now(),
                route: DetailActiveFirstSeen.routeName,
              ),
              CardItem(
                type: TypeFirstSeen.Active,
                title: "bd5i smr",
                expiring: DateTime.now(),
                visited: DateTime.now(),
                route: DetailActiveFirstSeen.routeName,
              ),
              CardItem(
                type: TypeFirstSeen.Active,
                title: "bd5i smr",
                expiring: DateTime.now(),
                visited: DateTime.now(),
                route: DetailActiveFirstSeen.routeName,
              ),
            ],
          ),
        )),
      ),
      tabBarViewTab2: RefreshIndicator(
        onRefresh: refreshDataExpired,
        child: SingleChildScrollView(
            child: Container(
          margin: const EdgeInsets.only(bottom: ConstSpacing.bottom),
          child: Column(
            children: [
              CardItem(
                type: TypeFirstSeen.Expired,
                title: "bd5i smr",
                expiring: DateTime.now(),
                visited: DateTime.now(),
                route: DetailExpriedFirstSeen.routeName,
              ),
              CardItem(
                type: TypeFirstSeen.Expired,
                title: "bd5i smr",
                expiring: DateTime.now(),
                visited: DateTime.now(),
                route: DetailExpriedFirstSeen.routeName,
              ),
              CardItem(
                type: TypeFirstSeen.Expired,
                title: "bd5i smr",
                expiring: DateTime.now(),
                visited: DateTime.now(),
                route: DetailExpriedFirstSeen.routeName,
              ),
              CardItem(
                type: TypeFirstSeen.Expired,
                title: "bd5i smr",
                expiring: DateTime.now(),
                visited: DateTime.now(),
                route: DetailExpriedFirstSeen.routeName,
              ),
              CardItem(
                type: TypeFirstSeen.Expired,
                title: "bd5i smr",
                expiring: DateTime.now(),
                visited: DateTime.now(),
                route: DetailExpriedFirstSeen.routeName,
              ),
              CardItem(
                type: TypeFirstSeen.Expired,
                title: "bd5i smr",
                expiring: DateTime.now(),
                visited: DateTime.now(),
                route: DetailExpriedFirstSeen.routeName,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
