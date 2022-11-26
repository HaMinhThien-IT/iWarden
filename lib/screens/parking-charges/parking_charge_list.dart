import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/common/bottom_sheet_2.dart';
import 'package:iWarden/models/contravention.dart';
import 'package:iWarden/providers/contraventions.dart';
import 'package:iWarden/screens/first-seen/active_first_seen_screen.dart';
import 'package:iWarden/screens/home_overview.dart';
import 'package:iWarden/screens/parking-charges/issue_pcn_first_seen.dart';
import 'package:iWarden/screens/parking-charges/parking_charge_detail.dart';
import 'package:iWarden/theme/text_theme.dart';
import 'package:iWarden/widgets/app_bar.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';
import 'package:iWarden/widgets/parking-charge/card_item.dart';
import 'package:provider/provider.dart';

class ParkingChargeList extends StatefulWidget {
  static const routeName = 'parking-charges-list';
  const ParkingChargeList({super.key});

  @override
  State<ParkingChargeList> createState() => _ParkingChargeListState();
}

class _ParkingChargeListState extends State<ParkingChargeList> {
  List<Contravention> contraventionList = [];

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
      final contraventionProvider =
          Provider.of<Contraventions>(context, listen: false);
      getContraventionList(contraventionProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    final contraventions = Provider.of<Contraventions>(context, listen: false);

    Future<void> refresh() async {
      getContraventionList(contraventions);
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: MyAppBar(
          title: 'Parking charges',
          automaticallyImplyLeading: true,
          onRedirect: () {
            Navigator.of(context).pushNamed(HomeOverview.routeName);
          },
        ),
        drawer: const MyDrawer(),
        bottomSheet: BottomSheet2(buttonList: [
          BottomNavyBarItem(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(IssuePCNFirstSeenScreen.routeName);
            },
            icon: SvgPicture.asset(
              "assets/svg/IconCharges2.svg",
              width: 16,
            ),
            label: const Text(
              'Issue PCN',
              style: CustomTextStyle.h6,
            ),
          ),
        ]),
        body: RefreshIndicator(
          onRefresh: refresh,
          child: FutureBuilder(
            future: contraventions.getContraventionList(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return contraventionList.isNotEmpty
                    ? SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Container(
                          margin: const EdgeInsets.only(top: 15, bottom: 100),
                          child: Column(
                            children: contraventionList
                                .map(
                                  (item) => InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                        ParkingChargeDetail.routeName,
                                        arguments: item,
                                      );
                                    },
                                    child: CardItemParkingCharge(
                                      image:
                                          item.contraventionPhotos!.isNotEmpty
                                              ? item.contraventionPhotos![0]
                                                  .blobName
                                              : "",
                                      plate: item.plate as String,
                                      contraventions: item.reason
                                              ?.contraventionReasonTranslations ??
                                          [],
                                      created: item.created as DateTime,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      )
                    : const Center(
                        child: Text(
                          'No data!',
                          style: CustomTextStyle.body1,
                        ),
                      );
              } else if (snapshot.hasError) {
                return const ServerError();
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
          ),
        ),
      ),
    );
  }
}
