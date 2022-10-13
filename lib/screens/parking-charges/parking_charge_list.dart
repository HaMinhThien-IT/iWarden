import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/common/bottom_sheet_2.dart';
import 'package:iWarden/theme/text_theme.dart';
import 'package:iWarden/widgets/app_bar.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';
import 'package:iWarden/widgets/parking-charge/card_item.dart';

class ParkingChargeList extends StatefulWidget {
  static const routeName = 'parking-charges-list';
  const ParkingChargeList({super.key});

  @override
  State<ParkingChargeList> createState() => _ParkingChargeListState();
}

class _ParkingChargeListState extends State<ParkingChargeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Parking charges',
      ),
      drawer: const MyDrawer(),
      bottomSheet: BottomSheet2(buttonList: [
        BottomNavyBarItem(
          onPressed: () {},
          icon: SvgPicture.asset("assets/svg/IconCharges2.svg"),
          label: const Text(
            'Issue PCN',
            style: CustomTextStyle.h6,
          ),
        ),
        BottomNavyBarItem(
          onPressed: () {},
          icon: SvgPicture.asset("assets/svg/IconRefresh.svg"),
          label: const Text(
            'Refresh list',
            style: CustomTextStyle.h6,
          ),
        ),
      ]),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 15, bottom: 100),
          child: Column(
            children: [
              CardItemParkingCharge(
                title: 'bd5i smr',
                contravention: 'Article 27',
                created: DateTime.now(),
                fineAmount: 35,
              ),
              const SizedBox(height: 5),
              CardItemParkingCharge(
                title: 'bd5i smr',
                contravention: 'Article 27',
                created: DateTime.now(),
                fineAmount: 35,
              ),
              const SizedBox(height: 5),
              CardItemParkingCharge(
                title: 'bd5i smr',
                contravention: 'Article 27',
                created: DateTime.now(),
                fineAmount: 35,
              ),
              const SizedBox(height: 5),
              CardItemParkingCharge(
                title: 'bd5i smr',
                contravention: 'Article 27',
                created: DateTime.now(),
                fineAmount: 35,
              ),
              const SizedBox(height: 5),
              CardItemParkingCharge(
                title: 'bd5i smr',
                contravention: 'Article 27',
                created: DateTime.now(),
                fineAmount: 35,
              ),
              const SizedBox(height: 5),
              CardItemParkingCharge(
                title: 'bd5i smr',
                contravention: 'Article 27',
                created: DateTime.now(),
                fineAmount: 35,
              ),
              const SizedBox(height: 5),
              CardItemParkingCharge(
                title: 'bd5i smr',
                contravention: 'Article 27',
                created: DateTime.now(),
                fineAmount: 35,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
