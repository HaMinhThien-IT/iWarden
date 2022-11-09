import 'package:flutter/material.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';

class SiteItem extends StatelessWidget {
  final dynamic siteItem;
  const SiteItem({required this.siteItem, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      visualDensity: const VisualDensity(
        horizontal: 0,
        vertical: -4,
      ),
      dense: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 0,
      ),
      leading: Container(
        width: 5,
        height: 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: ColorTheme.primary,
        ),
      ),
      horizontalTitleGap: -20,
      title: Text(
        siteItem.siteName,
        style: CustomTextStyle.body1.copyWith(
          color: ColorTheme.textPrimary,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        siteItem.address,
        style: CustomTextStyle.chart.copyWith(
          color: ColorTheme.grey600,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }
}
