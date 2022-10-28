import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';
import 'package:iWarden/widgets/drawer/model/menu_item.dart';
import 'package:iWarden/widgets/drawer/model/nav_item.dart';

class NavItem extends StatelessWidget {
  final NavItemMenu itemMenu;
  const NavItem({super.key, required this.itemMenu});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: itemMenu.setCheck,
      child: Column(
        children: <Widget>[
          if (itemMenu.check != null)
            Container(
              width: 32,
              height: 32,
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  color: itemMenu.background,
                  borderRadius: BorderRadius.circular(40)),
              child: itemMenu.check == true
                  ? SvgPicture.asset('assets/svg/IconEndBreak.svg')
                  : SvgPicture.asset('assets/svg/IconStartBreak.svg'),
            ),
          if (itemMenu.check == null)
            Container(
              width: 32,
              height: 32,
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  color: itemMenu.background,
                  borderRadius: BorderRadius.circular(40)),
              child: itemMenu.icon,
            ),
          if (itemMenu.check == null)
            Text(
              itemMenu.title,
              style: CustomTextStyle.h6.copyWith(
                color: itemMenu.check == null
                    ? ColorTheme.grey600
                    : ColorTheme.secondary,
              ),
            ),
          if (itemMenu.check != null)
            Text(
              itemMenu.check == false ? itemMenu.title : "End break",
              style: CustomTextStyle.h6.copyWith(
                color: itemMenu.check == null
                    ? ColorTheme.grey600
                    : ColorTheme.secondary,
              ),
            )
        ],
      ),
    );
  }
}
