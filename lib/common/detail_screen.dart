import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iWarden/common/slide_image.dart';
import 'package:iWarden/configs/const.dart';
import 'package:iWarden/models/first_seen.dart';
import 'package:iWarden/screens/parking-charges/issue_pcn_first_seen.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';
import 'package:iWarden/widgets/detail_issue.dart';

import 'package:iWarden/widgets/app_bar.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';

class DetailScreen extends StatelessWidget {
  final TypeFirstSeen type;

  const DetailScreen({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final padding = type == TypeFirstSeen.Expired ? 30.0 : 05.0;
    final divisor = type == TypeFirstSeen.Expired ? 3 : 2;
    final divisor2 = type == TypeFirstSeen.Expired ? 0.00 : 12;
    return Scaffold(
      appBar: MyAppBar(
          title: "bd5i smr".toUpperCase(), automaticallyImplyLeading: true),
      drawer: const MyDrawer(),
      bottomSheet: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 1, color: ColorTheme.grey300),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: ((widthScreen / divisor) - padding) - divisor2,
                child: TextButton.icon(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/svg/IconCar.svg"),
                    label: const Text(
                      "Car left",
                      style: CustomTextStyle.h6,
                    )),
              ),
              if (type == TypeFirstSeen.Expired)
                Container(
                  height: 25,
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      vertical: BorderSide(
                        width: 0.5,
                        color: ColorTheme.grey300,
                      ),
                    ),
                  ),
                ),
              if (type == TypeFirstSeen.Expired)
                SizedBox(
                  width: ((widthScreen / divisor) - padding) - divisor2,
                  child: TextButton.icon(
                      onPressed: () {},
                      icon: SvgPicture.asset("assets/svg/IconCharges2.svg"),
                      label: const Text(
                        "Issue PCN",
                        style: CustomTextStyle.h6,
                      )),
                ),
              Container(
                height: 25,
                decoration: const BoxDecoration(
                  border: Border.symmetric(
                    vertical: BorderSide(
                      width: 0.5,
                      color: ColorTheme.grey300,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: ((widthScreen / divisor) - padding) - divisor2,
                child: TextButton.icon(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/svg/IconLocation.svg"),
                    label: const Text(
                      "Located",
                      style: CustomTextStyle.h6,
                    )),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.width < 400
                  ? 0
                  : ConstSpacing.bottom),
          child: Column(
            children: <Widget>[
              const DetailIssue(),
              Container(
                color: ColorTheme.secondary,
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                child: Text(
                  "Expiring in: 1hr 12min",
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.h5.copyWith(color: ColorTheme.danger),
                ),
              ),
              const ManuallyControlledSlider(),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
