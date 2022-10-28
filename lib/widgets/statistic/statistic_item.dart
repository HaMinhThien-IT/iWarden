import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';

class StatisticItem extends StatelessWidget {
  final Color background;
  final String assetIcon;
  final String title;
  final int quantity;
  const StatisticItem(
      {required this.assetIcon,
      required this.background,
      required this.quantity,
      required this.title,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 5,
            color: ColorTheme.boxShadow,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 13),
              color: background,
              child: SvgPicture.asset(assetIcon),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Text(
                    title,
                    style:
                        CustomTextStyle.h6.copyWith(color: ColorTheme.grey600),
                  ),
                  Text(
                    quantity.toString(),
                    style: CustomTextStyle.h2.copyWith(
                        color: ColorTheme.grey600, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
