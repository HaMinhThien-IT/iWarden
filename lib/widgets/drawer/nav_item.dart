import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';
import 'package:iWarden/widgets/drawer/model/menu_item.dart';

class NavItem extends StatelessWidget {
  final ItemMenu itemMenu;
  const NavItem({super.key, required this.itemMenu});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 32,
          height: 32,
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
              color: ColorTheme.grey200,
              borderRadius: BorderRadius.circular(40)),
          child: SvgPicture.asset(itemMenu.assetIcon),
        ),
        Text(
          itemMenu.title,
          style: CustomTextStyle.h6.copyWith(
            color: ColorTheme.grey600,
          ),
        )
      ],
    );
  }
}
