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
      required this.infoLeft,
      required this.infoRight,
      required this.title,
      required this.route})
      : super(key: key);

  final double width;
  final Color backgroundIcon;
  final String assetIcon;
  final String title;
  final String desc;
  final String infoRight;
  final String infoLeft;
  final String route;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Card(
              elevation: 0,
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                    width: 56,
                    height: 56,
                    color: backgroundIcon,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SvgPicture.asset(
                        assetIcon,
                      ),
                    )),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title),
                    Row(
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () {},
                          icon: SvgPicture.asset("assets/svg/IconCharges2.svg"),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () {},
                          icon: SvgPicture.asset("assets/svg/IconCharges2.svg"),
                        ),
                      ],
                    )
                  ],
                ),
                subtitle: Text(
                  desc,
                  style: CustomTextStyle.h6.copyWith(
                    color: ColorTheme.grey600,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                ),
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
                const SizedBox(
                  width: 10,
                ),
                Text(
                  infoLeft,
                  style: CustomTextStyle.h6.copyWith(
                    color: ColorTheme.danger,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
