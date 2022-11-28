import 'package:flutter/material.dart';
import 'package:iWarden/common/card_item.dart';
import 'package:iWarden/common/my_dialog.dart';
import 'package:iWarden/common/tabbar.dart';
import 'package:iWarden/configs/const.dart';
import 'package:iWarden/controllers/vehicle_information_controller.dart';
import 'package:iWarden/models/first_seen.dart';
import 'package:iWarden/models/vehicle_information.dart';
import 'package:iWarden/providers/vehicle_info.dart';
import 'package:iWarden/screens/first-seen/active_detail_first_seen.dart';
import 'package:iWarden/screens/first-seen/active_first_seen_screen.dart';
import 'package:iWarden/screens/first-seen/expired_detail_first_seen.dart';
import 'package:iWarden/screens/grace-period/add_grace_period.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';
import 'package:provider/provider.dart';

class GracePeriodList extends StatefulWidget {
  static const routeName = '/grace-period-list';
  const GracePeriodList({super.key});

  @override
  State<GracePeriodList> createState() => _GracePeriodListState();
}

class _GracePeriodListState extends State<GracePeriodList> {
  List<VehicleInformation> gracePeriodActive = [];
  List<VehicleInformation> gracePeriodExpired = [];
  final calculateTime = CalculateTime();

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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final firstSeenProvider =
          Provider.of<VehicleInfo>(context, listen: false);
      getGracePeriodList(firstSeenProvider);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vehicleProvider = Provider.of<VehicleInfo>(context);

    void onCarLeft(VehicleInformation vehicleInfo) {
      VehicleInformation vehicleInfoToUpdate = VehicleInformation(
        ExpiredAt: vehicleInfo.ExpiredAt,
        Plate: vehicleInfo.Plate,
        ZoneId: vehicleInfo.ZoneId,
        LocationId: vehicleInfo.LocationId,
        BayNumber: vehicleInfo.BayNumber,
        Type: vehicleInfo.Type,
        Latitude: vehicleInfo.Latitude,
        Longitude: vehicleInfo.Longitude,
        CarLeft: true,
        EvidencePhotos: [],
        Id: vehicleInfo.Id,
      );

      showDialog<void>(
        context: context,
        barrierDismissible: true,
        barrierColor: ColorTheme.backdrop,
        builder: (BuildContext context) {
          return Consumer<VehicleInfo>(
            builder: (context, firstSeen, _) {
              return MyDialog(
                title: Text(
                  "Confirm",
                  style: CustomTextStyle.h4.copyWith(color: ColorTheme.danger),
                ),
                subTitle: const Text(
                  "Confirm the vehicle has left.",
                  style: CustomTextStyle.h5,
                ),
                func: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: ColorTheme.danger,
                  ),
                  child: Text("Proceed",
                      style: CustomTextStyle.h5.copyWith(
                        color: Colors.white,
                      )),
                  onPressed: () async {
                    await VehicleInfoController()
                        .upsertVehicleInfo(vehicleInfoToUpdate)
                        .then((value) {
                      Navigator.of(context).pop();
                      getGracePeriodList(vehicleProvider);
                    });
                  },
                ),
              );
            },
          );
        },
      );
    }

    Future<void> refresh() async {
      getGracePeriodList(vehicleProvider);
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: MyTabBar(
        labelFuncAdd: "Add Consideration Period",
        titleAppBar: "Consideration Period",
        funcAdd: () {
          Navigator.of(context).pushNamed(AddGracePeriod.routeName);
        },
        tabBarViewTab1: RefreshIndicator(
          onRefresh: refresh,
          child: FutureBuilder(
              future: vehicleProvider.getGracePeriodList(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return gracePeriodActive.isNotEmpty
                      ? SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Container(
                            margin: const EdgeInsets.only(
                                bottom: ConstSpacing.bottom),
                            child: Column(
                              children: gracePeriodActive
                                  .map(
                                    (item) => CardItem(
                                      vehicleInfo: item,
                                      type: TypeFirstSeen.Active,
                                      expiring: calculateTime.daysBetween(
                                        item.Created!.add(
                                          Duration(
                                            minutes: calculateTime.daysBetween(
                                              item.Created as DateTime,
                                              DateTime.now(),
                                            ),
                                          ),
                                        ),
                                        item.ExpiredAt,
                                      ),
                                      onCarLeft: () {
                                        onCarLeft(item);
                                      },
                                      route: DetailActiveFirstSeen.routeName,
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
              })),
        ),
        tabBarViewTab2: RefreshIndicator(
          onRefresh: refresh,
          child: FutureBuilder(
              future: vehicleProvider.getGracePeriodList(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return gracePeriodExpired.isNotEmpty
                      ? SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Container(
                            margin: const EdgeInsets.only(
                                bottom: ConstSpacing.bottom),
                            child: Column(
                              children: gracePeriodExpired
                                  .map(
                                    (item) => CardItem(
                                      vehicleInfo: item,
                                      type: TypeFirstSeen.Expired,
                                      expiring: calculateTime.daysBetween(
                                        item.ExpiredAt,
                                        DateTime.now(),
                                      ),
                                      onCarLeft: () {
                                        onCarLeft(item);
                                      },
                                      route: DetailExpiredFirstSeen.routeName,
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
              })),
        ),
        quantityActive: gracePeriodActive.length,
        quantityExpired: gracePeriodExpired.length,
      ),
    );
  }
}
