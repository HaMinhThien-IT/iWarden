import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/common/bottom_sheet_2.dart';
import 'package:iWarden/controllers/contravention_controller.dart';
import 'package:iWarden/models/contravention.dart';
import 'package:iWarden/screens/abort-screen/abort_screen.dart';
import 'package:iWarden/screens/first-seen/active_first_seen_screen.dart';
import 'package:iWarden/screens/parking-charges/print_issue.dart';
import 'package:iWarden/theme/text_theme.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';
import 'package:iWarden/widgets/parking-charge/detail_parking_common.dart';

class PrintPCN extends StatefulWidget {
  static const routeName = '/print-pcn';
  const PrintPCN({super.key});

  @override
  State<PrintPCN> createState() => _PrintPCNState();
}

class _PrintPCNState extends State<PrintPCN> {
  Contravention? contravention;
  int contraventionId = 0;

  void getContraventionDetail(int id) async {
    await contraventionController.getContraventionDetail(id).then((value) {
      print(value.contraventionPhotos!.length);
      setState(() {
        contravention = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final args = ModalRoute.of(context)!.settings.arguments as Contravention;
      contraventionId = args.id as int;
      getContraventionDetail(args.id as int);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        drawer: const MyDrawer(),
        bottomSheet: BottomSheet2(buttonList: [
          BottomNavyBarItem(
            onPressed: () {
              Navigator.of(context).pushNamed(
                AbortScreen.routeName,
                arguments: contravention,
              );
            },
            icon: SvgPicture.asset('assets/svg/IconAbort.svg'),
            label: const Text(
              'Abort',
              style: CustomTextStyle.h6,
            ),
          ),
          BottomNavyBarItem(
            onPressed: () {},
            icon: SvgPicture.asset('assets/svg/IconPrinter.svg'),
            label: const Text(
              'Print again',
              style: CustomTextStyle.h6,
            ),
          ),
          BottomNavyBarItem(
            onPressed: () {
              Navigator.of(context).pushNamed(
                PrintIssue.routeName,
                arguments: contravention,
              );
            },
            icon: SvgPicture.asset('assets/svg/IconComplete.svg'),
            label: const Text(
              'Complete',
              style: CustomTextStyle.h6,
            ),
          ),
        ]),
        body: FutureBuilder(
          future:
              contraventionController.getContraventionDetail(contraventionId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SafeArea(
                child: DetailParkingCommon(
                  contravention: contravention,
                ),
              );
            } else if (snapshot.hasError) {
              return const ServerError();
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
