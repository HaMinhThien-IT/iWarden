import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';

class CardHome extends StatelessWidget {
  const CardHome(
      {Key? key,
      required this.width,
      required this.assetIcon,
      required this.backgroundIcon,
      required this.desc,
      this.infoLeft,
      required this.infoRight,
      required this.title,
      required this.routeView,
      required this.route})
      : super(key: key);

  final double width;
  final Color backgroundIcon;
  final String assetIcon;
  final String title;
  final String desc;
  final String infoRight;
  final String? infoLeft;
  final String route;
  final String routeView;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(routeView),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Card(
                semanticContainer: true,
                elevation: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 56,
                          height: 56,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              color: backgroundIcon,
                              borderRadius: BorderRadius.circular(3)),
                          child: Container(
                              padding: const EdgeInsets.all(17),
                              child: SvgPicture.asset(
                                assetIcon,
                              )),
                        ),
                        SizedBox(
                          width: width / 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                title,
                                style: CustomTextStyle.h5.copyWith(
                                  color: ColorTheme.textPrimary,
                                ),
                              ),
                              Text(
                                desc,
                                style: CustomTextStyle.h6.copyWith(
                                  color: ColorTheme.grey600,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, route);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                        child: SvgPicture.asset(
                          "assets/svg/IconPlus.svg",
                          width: 24.67,
                        ),
                      ),
                    ),
                  ],
                )),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    infoRight,
                    style: CustomTextStyle.h6.copyWith(
                      color: ColorTheme.success,
                    ),
                  ),
                  if (infoLeft != null)
                    const SizedBox(
                      width: 10,
                    ),
                  if (infoLeft != null)
                    Text(
                      infoLeft!,
                      style: CustomTextStyle.h6.copyWith(
                        color: ColorTheme.danger,
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
