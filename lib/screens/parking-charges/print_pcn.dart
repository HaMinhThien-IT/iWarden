import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/common/bottom_sheet_2.dart';
import 'package:iWarden/common/toast.dart';
import 'package:iWarden/controllers/contravention_controller.dart';
import 'package:iWarden/models/contravention.dart';
import 'package:iWarden/screens/abort-screen/abort_screen.dart';
import 'package:iWarden/screens/first-seen/active_first_seen_screen.dart';
import 'package:iWarden/screens/parking-charges/print_issue.dart';
import 'package:iWarden/theme/color.dart';
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
      setState(() {
        contravention = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      try {
        final args =
            ModalRoute.of(context)!.settings.arguments as Contravention;
        contraventionId = args.id as int;
        getContraventionDetail(args.id as int);
      } catch (error) {
        Navigator.of(context).pop();
        CherryToast.error(
          displayCloseButton: false,
          title: Text(
            'Error creating! Please try again!',
            style: CustomTextStyle.h5.copyWith(color: ColorTheme.danger),
          ),
          toastPosition: Position.bottom,
          borderRadius: 5,
        ).show(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        drawer: const MyDrawer(),
        bottomSheet: BottomSheet2(
          buttonList: contravention != null
              ? [
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
                ]
              : [],
        ),
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
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        'Internal server error!',
                        style: TextStyle(
                          color: ColorTheme.danger,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Go back!',
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
