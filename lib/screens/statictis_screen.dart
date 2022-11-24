import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/common/drop_down_button.dart';
import 'package:iWarden/controllers/statistic_controller.dart';
import 'package:iWarden/helpers/format_date.dart';
import 'package:iWarden/models/date_filter.dart';
import 'package:iWarden/models/statistic.dart';
import 'package:iWarden/providers/locations.dart';
import 'package:iWarden/screens/connecting_screen.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';
import 'package:iWarden/widgets/app_bar.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';
import 'package:iWarden/widgets/statistic/statistic_item.dart';
import 'package:gps_connectivity/gps_connectivity.dart';
import 'dart:async';
import 'dart:developer' as developer;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:provider/provider.dart';

class StatisticScreen extends StatefulWidget {
  static const routeName = '/statistic';
  const StatisticScreen({super.key});

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  _buildDevice(String nameDevice, bool stateDevice) {
    return Row(
      children: [
        SvgPicture.asset(stateDevice
            ? "assets/svg/IconCompleteActive.svg"
            : "assets/svg/IconDotCom.svg"),
        const SizedBox(
          width: 4,
        ),
        Text(
          nameDevice,
          style: CustomTextStyle.caption,
        )
      ],
    );
  }

  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  late StreamSubscription<bool> connectivitySubscriptionGps;
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> initConnectivityGPS() async {
    late bool result;
    try {
      result = await GpsConnectivity().checkGpsConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionGPSStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  Future<void> _updateConnectionGPSStatus(bool result) async {
    setState(() {
      checkGps = result;
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  final bool connected = true;
  bool checkGps = false;
  late CameraController controller;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final locations = Provider.of<Locations>(context, listen: false);
      getDataStatistic(
          locations.zone!.Id as int,
          formatDate.startOfDay(DateTime.now()),
          formatDate.endOfDay(DateTime.now()));
    });
    connectivitySubscriptionGps = GpsConnectivity()
        .onGpsConnectivityChanged
        .listen(_updateConnectionGPSStatus);
    initConnectivity();
    initConnectivityGPS();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

    super.initState();
  }

  final dataList = DataDateFilter().data.toList();
  StatisticWardenPropsData? statisticWardenData;
  String? selectedValue = DataDateFilter().data[0].value;

  getDataStatistic(int zoneId, DateTime from, DateTime to) {
    statisticController
        .getDataStatistic(
            StatisticWardenPropsFilter(zoneId: 1, timeEnd: to, timeStart: from))
        .then((value) {
      setState(() {
        statisticWardenData = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget listDevice = Container(
      height: 56,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDevice("GPS", checkGps),
                const SizedBox(
                  height: 8,
                ),
                _buildDevice("Bluetooth", true),
                // _buildDevice("Network status", false),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDevice("Network status",
                    _connectionStatus != ConnectivityResult.none),
                const SizedBox(
                  height: 8,
                ),
                _buildDevice("Camera", true),
                // _buildDevice("Network status", false),
              ],
            ),
          ),
        ],
      ),
    );
    return Scaffold(
      appBar: const MyAppBar(
        title: "Statistics",
        automaticallyImplyLeading: true,
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 16,
            ),
            listDevice,
            const SizedBox(
              height: 8,
            ),
            if (statisticWardenData != null)
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.width < 450
                    ? MediaQuery.of(context).size.height -
                        (58 + 8 + 16 + 55 + 24)
                    : null,
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(flex: 1, child: Text("My statistic")),
                        Expanded(
                          flex: 1,
                          child: DropDownButtonWidget(
                            hintText: 'Date filter',
                            item: dataList
                                .map(
                                  (itemValue) => DropdownMenuItem(
                                    value: itemValue.value.isEmpty
                                        ? ''
                                        : itemValue.value,
                                    child: Text(
                                      itemValue.label,
                                      style: CustomTextStyle.h5,
                                    ),
                                  ),
                                )
                                .toList(),
                            onchanged: (value) {
                              String testa = value as String;
                              String from = testa.split(',')[0];
                              String to = testa.split(',')[1];
                              getDataStatistic(
                                  Provider.of<Locations>(context, listen: false)
                                      .zone!
                                      .Id as int,
                                  DateTime.parse(
                                      from.substring(7, from.length)),
                                  DateTime.parse(
                                      to.substring(5, to.length - 1)));
                              setState(() {
                                selectedValue = value;
                              });
                            },
                            value: selectedValue,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: StatisticItem(
                            assetIcon: "assets/svg/IconFirstSeen.svg",
                            background: ColorTheme.lighterPrimary,
                            quantity: statisticWardenData!.firstSeen,
                            title: "First seen",
                          ),
                        ),
                        const SizedBox(
                          width: 32,
                        ),
                        Expanded(
                          child: StatisticItem(
                            assetIcon: "assets/svg/IconGrace.svg",
                            background: ColorTheme.lightDanger,
                            quantity: statisticWardenData!.gracePeriod,
                            title: "Grace period",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: StatisticItem(
                            assetIcon: "assets/svg/IconParkingChargesHome.svg",
                            background: ColorTheme.lighterSecondary,
                            quantity: statisticWardenData!.issuedPCN,
                            title: "Issued PCN",
                          ),
                        ),
                        const SizedBox(
                          width: 32,
                        ),
                        Expanded(
                          child: StatisticItem(
                            assetIcon: "assets/svg/IconWarning.svg",
                            background: ColorTheme.grey200,
                            quantity: statisticWardenData!.abortedPCN,
                            title: "Aborted PCN",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
