import 'package:flutter/material.dart';
import 'package:iWarden/widgets/app_bar.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';
import 'package:iWarden/widgets/parking-charge/detail_parking_common.dart';

class ParkingChargeDetail extends StatelessWidget {
  static const routeName = '/parking-charge-detail';
  const ParkingChargeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: "View PCN",
        automaticallyImplyLeading: true,
      ),
      drawer: const MyDrawer(),
      body: Container(
          margin: const EdgeInsets.only(top: 8),
          child: const DetailParkingCommon()),
    );
  }
}
