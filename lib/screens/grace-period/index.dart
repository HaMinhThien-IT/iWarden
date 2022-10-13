import 'package:flutter/material.dart';
import 'package:iWarden/common/tabbar.dart';

class GracePeriodList extends StatelessWidget {
  const GracePeriodList({super.key});

  @override
  Widget build(BuildContext context) {
    return MyTabBar(
      titleAppBar: "Grace period",
      quantityActive: 12,
      quantityExpired: 12,
      funcAdd: () {},
      funcRefresh: () {},
      tabBarViewTab1: Container(),
      tabBarViewTab2: Container(),
    );
  }
}
