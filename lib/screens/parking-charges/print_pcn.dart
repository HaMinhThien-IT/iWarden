import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/common/add_image.dart';
import 'package:iWarden/common/bottom_sheet_2.dart';
import 'package:iWarden/screens/abort-screen/abort_screen.dart';
import 'package:iWarden/widgets/parking-charge/detail_parking_common.dart';
import 'package:iWarden/screens/parking-charges/print_issue.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';
import 'package:iWarden/widgets/app_bar.dart';
import 'package:iWarden/widgets/detail_issue.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';
import 'package:iWarden/widgets/parking-charge/slider_image_parking.dart';

class PrintPCN extends StatelessWidget {
  static const routeName = '/print-pcn';
  const PrintPCN({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: const MyAppBar(
        //   title: "Parking charge detail",
        //   automaticallyImplyLeading: true,
        // ),
        drawer: const MyDrawer(),
        bottomSheet: BottomSheet2(buttonList: [
          BottomNavyBarItem(
            onPressed: () {
              Navigator.of(context).pushNamed(AbortScreen.routeName);
            },
            icon: SvgPicture.asset('assets/svg/IconAbort.svg'),
            label: const Text(
              'Abort',
              style: CustomTextStyle.h6,
            ),
          ),
          BottomNavyBarItem(
            onPressed: () {
              Navigator.of(context).pushNamed(PrintIssue.routeName);
            },
            icon: SvgPicture.asset('assets/svg/IconPrinter.svg'),
            label: const Text(
              'Print again',
              style: CustomTextStyle.h6,
            ),
          ),
          BottomNavyBarItem(
            onPressed: () {
              Navigator.of(context).pushNamed(PrintIssue.routeName);
            },
            icon: SvgPicture.asset('assets/svg/IconComplete.svg'),
            label: const Text(
              'Complete',
              style: CustomTextStyle.h6,
            ),
          ),
        ]),
        body: const SafeArea(child: DetailParkingCommon()));
  }
}
