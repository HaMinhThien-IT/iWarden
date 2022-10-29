import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/common/circle.dart';
import 'package:iWarden/common/dot.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';

enum StateDevice { connected, pending, disconnect }

class ConnectingScreen extends StatelessWidget {
  static const routeName = '/connect';
  const ConnectingScreen({super.key});
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

  final bool connected = true;
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
                  _buildConnect("3. GPS", StateDevice.connected),
                  _buildConnect("4. Transferring 1/5 PCN(s) to the server",
                      StateDevice.disconnect),
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
                  onPressed: () {},
                  child: Text(
                    "Next",
                    style: CustomTextStyle.h5.copyWith(color: Colors.white),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
