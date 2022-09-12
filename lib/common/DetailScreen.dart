import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iWarden/common/DropDownButton.dart';
import 'package:iWarden/common/SlideImage.dart';
import 'package:iWarden/common/custom.dart';
import 'package:iWarden/configs/const.dart';
import 'package:iWarden/helper/FormatDate.dart';
import 'package:iWarden/screens/IssuePCNFirstSeen.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/textTheme.dart';
import 'package:iWarden/widgets/DetailIssue.dart';

import 'package:iWarden/widgets/appBar.dart';
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
              ManuallyControlledSlider(),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 100,
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          margin: const EdgeInsets.only(right: 16),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: SizedBox(
                              width: 56.0,
                              height: 56.0,
                              child: Image.network(
                                "https://www.mercedes-benz.com.vn/vi/passengercars/mercedes-benz-cars/amg/_jcr_content/par/textimagecombination_1732294460/image.MQ6.12.image.20200810140607.jpeg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -10,
                        right: 5,
                        child: InkWell(
                          onTap: () {
                            // remove(index);
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            padding: const EdgeInsets.all(3.5),
                            decoration: BoxDecoration(
                                color: ColorTheme.grey400,
                                borderRadius: BorderRadius.circular(20)),
                            child:
                                SvgPicture.asset("assets/svg/IconCannel.svg"),
                          ),
                        ),
                      )
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
