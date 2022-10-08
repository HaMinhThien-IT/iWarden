import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iWarden/common/slide_image.dart';
import 'package:iWarden/configs/const.dart';
import 'package:iWarden/screens/issue_pcn_first_seen.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';
import 'package:iWarden/widgets/detail_issue.dart';

import 'package:iWarden/widgets/app_bar.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
          title: "bd5i smr".toUpperCase(), automaticallyImplyLeading: true),
      drawer: const MyDrawer(),
      bottomSheet: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(width: 1, color: ColorTheme.grey300),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/svg/IconCar.svg"),
                  label: const Text(
                    "Car left",
                    style: CustomTextStyle.h6,
                  )),
              Container(
                height: 25,
                decoration: const BoxDecoration(
                    border: Border.symmetric(
                        vertical:
                            BorderSide(width: 0.5, color: ColorTheme.grey300))),
              ),
              TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                        IssuePCNFirstSeenScreen.routeName,
                        arguments: {'id': 2});
                  },
                  icon: SvgPicture.asset("assets/svg/IconCharges2.svg"),
                  label: const Text(
                    "Issue charge",
                    style: CustomTextStyle.h6,
                  )),
              Container(
                height: 25,
                decoration: const BoxDecoration(
                    border: Border.symmetric(
                        vertical:
                            BorderSide(width: 0.5, color: ColorTheme.grey300))),
              ),
              TextButton.icon(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/svg/IconLocation.svg"),
                  label: const Text(
                    "Locate car",
                    style: CustomTextStyle.h6,
                  )),
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
