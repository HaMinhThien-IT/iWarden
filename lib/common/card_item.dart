import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';

class CardItem extends StatelessWidget {
  const CardItem(
      {Key? key,
      required this.width,
      required this.desc,
      required this.infoLeft,
      required this.infoRight,
      required this.title,
      required this.currentIndexTab,
      required this.route})
      : super(key: key);

  final double width;
  final int currentIndexTab;
  final String title;
  final String desc;
  final String infoRight;
  final String infoLeft;
  final String route;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(route, arguments: {'id': 1});
      },
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: <Widget>[
            Card(
                semanticContainer: true,
                elevation: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image.network(
                              "https://static.danhgiaxe.com/data/review/thanhnhan_auto_audi-a4-2014-35_737.jpg",
                              width: 72,
                              height: 72,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width / 2.4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                title,
                                style: CustomTextStyle.h4.copyWith(
                                  color: ColorTheme.textPrimary,
                                ),
                              ),
                              Text(
                                "Expiring in: 12:12:23",
                                style: CustomTextStyle.h6.copyWith(
                                  color: ColorTheme.danger,
                                ),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                "Visited: 12:12:23 12/08/2022",
                                style: CustomTextStyle.chart.copyWith(
                                  color: ColorTheme.grey600,
                                ),
                                textAlign: TextAlign.start,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        if (currentIndexTab == 1)
                          InkWell(
                            onTap: () {
                              // ignore: avoid_print
                              print("in");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
                              padding: const EdgeInsets.only(
                                  bottom: 8, left: 8, right: 8, top: 5),
                              child: SvgPicture.asset(
                                "assets/svg/IconCharges2.svg",
                                color: ColorTheme.grey600,
                                width: 22,
                              ),
                            ),
                          ),
                        InkWell(
                          onTap: () {
                            // ignore: avoid_print
                            print("in");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30)),
                            padding: const EdgeInsets.only(
                                bottom: 8, left: 8, right: 8, top: 5),
                            child: SvgPicture.asset(
                              "assets/svg/IconLocation.svg",
                              width: 16,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // ignore: avoid_print
                            print("in");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30)),
                            padding: const EdgeInsets.only(
                                bottom: 8, left: 8, right: 0, top: 5),
                            child: SvgPicture.asset(
                              "assets/svg/IconCar.svg",
                              width: 22,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
