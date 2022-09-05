import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iWarden/common/SlideImage.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/textTheme.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/svg/IconPlus.svg"),
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
                  onPressed: () {},
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
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            margin: const EdgeInsets.only(top: 16),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "bd5i smr".toUpperCase(),
                      style: CustomTextStyle.h4,
                    ),
                    const Text(
                      "Bay number: 12",
                      style: CustomTextStyle.h6,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Expired in: 12:12:23",
                        style: CustomTextStyle.h6
                            .copyWith(color: ColorTheme.danger)),
                    Text("Visited: 12:12:23 12/08/2022",
                        style: CustomTextStyle.h6
                            .copyWith(color: ColorTheme.grey600)),
                  ],
                )
              ],
            ),
          ),
          // ManuallyControlledSlider()

          Container(
            height: 70,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 3),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 56.0,
                  child: InkWell(
                    onTap: () {},
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: SizedBox(
                        width: 24.0,
                        height: 24.0,
                        child: SvgPicture.asset("assets/svg/IconCamera.svg"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    height: 56.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(imgList.length, (int index) {
                        return Flexible(
                          child: InkWell(
                            onTap: () {},
                            child: Card(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: SizedBox(
                                  width: 56.0,
                                  height: 56.0,
                                  child: Image.network(imgList[index],
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
