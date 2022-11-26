import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/common/circle.dart';
import 'package:iWarden/common/dot.dart';
import 'package:iWarden/screens/location/location_screen.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';
import 'package:gps_connectivity/gps_connectivity.dart';
import 'dart:async';
import 'dart:developer' as developer;

import 'package:connectivity_plus/connectivity_plus.dart';

enum StateDevice { connected, pending, disconnect }

class ConnectingScreen extends StatefulWidget {
  static const routeName = '/connect';
  const ConnectingScreen({super.key});

  @override
  State<ConnectingScreen> createState() => _ConnectingScreenState();
}

class _ConnectingScreenState extends State<ConnectingScreen> {
  _buildConnect(String title, StateDevice state) {
    return Container(
      margin: const EdgeInsets.only(bottom: 19),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: CustomTextStyle.h5,
          ),
          if (state == StateDevice.pending)
            SpinKitCircle(
              color: ColorTheme.primary,
              size: 18,
            ),
          if (state == StateDevice.disconnect)
            SvgPicture.asset("assets/svg/IconDotCom.svg"),
          if (state == StateDevice.connected)
            SvgPicture.asset("assets/svg/IconCompleteActive.svg")
        ],
      ),
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
  bool? checkGps;
  @override
  void initState() {
    connectivitySubscriptionGps = GpsConnectivity()
        .onGpsConnectivityChanged
        .listen(_updateConnectionGPSStatus);
    initConnectivity();
    initConnectivityGPS();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    super.initState();
  }

  StateDevice checkState(bool check) {
    if (check) {
      return StateDevice.connected;
    } else {
      return StateDevice.disconnect;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 80,
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (connected == false)
                    Text(
                      "Connecting pair devices",
                      style: CustomTextStyle.h3
                          .copyWith(color: ColorTheme.primary),
                    ),
                  if (connected == true)
                    Text(
                      "Connect successfully",
                      style: CustomTextStyle.h3
                          .copyWith(color: ColorTheme.primary),
                    ),
                  if (connected == false)
                    Container(
                      margin: const EdgeInsets.only(top: 10, left: 2),
                      child: SpinKitThreeBounce(
                        color: ColorTheme.primary,
                        size: 7,
                      ),
                    )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [
                  _buildConnect("1. Connect Bluetooth", StateDevice.pending),
                  _buildConnect(
                      "2. Connect Printer ezpvs56989", StateDevice.pending),
                  _buildConnect("3. GPS", checkState(checkGps == true)),
                  _buildConnect("4. Transferring 1/5 PCN(s) to the server",
                      checkState(_connectionStatus != ConnectivityResult.none)),
                ],
              ),
            ),
            if (connected == true)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(LocationScreen.routeName);
                  },
                  child: Text(
                    "Start shift",
                    style: CustomTextStyle.h5.copyWith(color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
