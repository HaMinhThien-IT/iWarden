import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/common/bottom_sheet_2.dart';
import 'package:iWarden/models/contravention.dart';
import 'package:iWarden/models/vehicle_information.dart';
import 'package:iWarden/providers/contraventions.dart';
import 'package:iWarden/providers/vehicle_info.dart';
import 'package:iWarden/screens/first-seen/active_first_seen_screen.dart';
import 'package:iWarden/screens/first-seen/add-first-seen/add_first_seen_screen.dart';
import 'package:iWarden/screens/grace-period/add_grace_period.dart';
import 'package:iWarden/screens/grace-period/index.dart';
import 'package:iWarden/screens/parking-charges/issue_pcn_first_seen.dart';
import 'package:iWarden/screens/parking-charges/parking_charge_list.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';
import 'package:iWarden/widgets/app_bar.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';
import 'package:iWarden/widgets/drawer/info_drawer.dart';
import 'package:iWarden/widgets/home/card_home.dart';
import 'package:provider/provider.dart';

class HomeOverview extends StatefulWidget {
  static const routeName = '/home';
  const HomeOverview({Key? key}) : super(key: key);

  @override
  State<HomeOverview> createState() => _HomeOverviewState();
}

class _HomeOverviewState extends State<HomeOverview> {
  bool stateLunch = false;
  List<VehicleInformation> firstSeenActive = [];
  List<VehicleInformation> firstSeenExpired = [];
  List<VehicleInformation> gracePeriodActive = [];
  List<VehicleInformation> gracePeriodExpired = [];
  List<Contravention> contraventionList = [];
  final calculateTime = CalculateTime();

  Future<void> getFirstSeenList(VehicleInfo firstSeenProvider) async {
    firstSeenProvider.getFirstSeenList().then((value) {
      setState(() {
        firstSeenActive = value.where((i) {
          return calculateTime.daysBetween(
                i.Created!.add(
                  Duration(
                    minutes: calculateTime.daysBetween(
                      i.Created as DateTime,
                      DateTime.now(),
                    ),
                  ),
                ),
                i.ExpiredAt,
              ) >
              0;
        }).toList();

        firstSeenExpired = value.where((i) {
          return calculateTime.daysBetween(
                i.Created!.add(
                  Duration(
                    minutes: calculateTime.daysBetween(
                      i.Created as DateTime,
                      DateTime.now(),
                    ),
                  ),
                ),
                i.ExpiredAt,
              ) <=
              0;
        }).toList();
      });
    });
  }

  Future<void> getGracePeriodList(VehicleInfo firstSeenProvider) async {
    firstSeenProvider.getGracePeriodList().then((value) {
      setState(() {
        gracePeriodActive = value.where((i) {
          return calculateTime.daysBetween(
                i.Created!.add(
                  Duration(
                    minutes: calculateTime.daysBetween(
                      i.Created as DateTime,
                      DateTime.now(),
                    ),
                  ),
                ),
                i.ExpiredAt,
              ) >
              0;
        }).toList();

        gracePeriodExpired = value.where((i) {
          return calculateTime.daysBetween(
                i.Created!.add(
                  Duration(
                    minutes: calculateTime.daysBetween(
                      i.Created as DateTime,
                      DateTime.now(),
                    ),
                  ),
                ),
                i.ExpiredAt,
              ) <=
              0;
        }).toList();
      });
    });
  }

  void getContraventionList(Contraventions contraventionProvider) {
    contraventionProvider.getContraventionList().then((value) {
      setState(() {
        contraventionList = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final firstSeenProvider =
          Provider.of<VehicleInfo>(context, listen: false);
      final contraventionProvider =
          Provider.of<Contraventions>(context, listen: false);
      getFirstSeenList(firstSeenProvider);
      getGracePeriodList(firstSeenProvider);
      getContraventionList(contraventionProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const MyAppBar(title: "Home"),
      drawer: const MyDrawer(),
      bottomSheet: BottomSheet2(buttonList: [
        BottomNavyBarItem(
            onPressed: () {
              setState(() {
                stateLunch = !stateLunch;
              });
            },
            icon: SvgPicture.asset(
              stateLunch
                  ? "assets/svg/IconEndBreak.svg"
                  : "assets/svg/IconStartBreak.svg",
              color: ColorTheme.grey600,
            ),
            label: Text(
              !stateLunch ? "Start lunch" : "End lunch",
              style: CustomTextStyle.h6,
            )),
        BottomNavyBarItem(
            onPressed: () {},
            icon: SvgPicture.asset("assets/svg/CheckOut.svg"),
            label: Text(
              "Check out",
              style: CustomTextStyle.h6.copyWith(color: ColorTheme.danger),
            )),
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            const InfoDrawer(
              isDrawer: false,
              assetImage: "assets/images/avatar.png",
              name: "Tom Smiths",
              location: "Castlepoint Shopping centre",
              zone: "Car park 1",
            ),
            const SizedBox(
              height: 10,
            ),
            CardHome(
              width: width,
              assetIcon: "assets/svg/IconFirstSeen.svg",
              backgroundIcon: ColorTheme.lighterPrimary,
              title: "First seen",
              desc:
                  "First seen list description \nFirst seen list description description",
              infoRight: "Active: ${firstSeenActive.length}",
              infoLeft: "Expired: ${firstSeenExpired.length}",
              route: AddFirstSeenScreen.routeName,
              routeView: ActiveFirstSeenScreen.routeName,
            ),
            const SizedBox(
              height: 10,
            ),
            CardHome(
              width: width,
              assetIcon: "assets/svg/IconGrace.svg",
              backgroundIcon: ColorTheme.lightDanger,
              title: "Consideration Period",
              desc:
                  "Grace period list description Grace period list description...",
              infoRight: "Active: ${gracePeriodActive.length}",
              infoLeft: "Expired: ${gracePeriodExpired.length}",
              route: AddGracePeriod.routeName,
              routeView: GracePeriodList.routeName,
            ),
            const SizedBox(
              height: 10,
            ),
            CardHome(
              width: width,
              assetIcon: "assets/svg/IconParkingChargesHome.svg",
              backgroundIcon: ColorTheme.lighterSecondary,
              title: "Parking Charges",
              desc:
                  "Parking charges list description Parking charges list description",
              infoRight: "Issued: ${contraventionList.length}",
              infoLeft: null,
              route: IssuePCNFirstSeenScreen.routeName,
              routeView: ParkingChargeList.routeName,
            ),
          ],
        ),
      ),
    );
  }
}
