import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';
import 'package:iWarden/widgets/drawer/model/menu_item.dart';

class ItemMenuWidget extends StatelessWidget {
  final ItemMenu itemMenu;

  const ItemMenuWidget({
    required this.itemMenu,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool activeRoute() {
      return (ModalRoute.of(context)!.settings.name as String) ==
          itemMenu.route;
    }

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: activeRoute()
              ? ColorTheme.lighterPrimary
              : itemMenu.route == "checkout"
                  ? ColorTheme.lightDanger
                  : null),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacementNamed(itemMenu.route!);
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: SvgPicture.asset(
                itemMenu.icon,
                color: activeRoute()
                    ? ColorTheme.darkPrimary
                    : itemMenu.route == "checkout"
                        ? ColorTheme.danger
                        : ColorTheme.grey600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                itemMenu.title,
                style: CustomTextStyle.h6.copyWith(
                    color: itemMenu.route == "checkout"
                        ? ColorTheme.danger
                        : ColorTheme.textPrimary),
              ),
            )
          ],
        ),
      ),
    );
  }
}
//  color: itemMenu.route == "checkout"
//                         ? ColorTheme.danger
//                         : activeRoute()
//                             ? ColorTheme.darkPrimary
//                             : ColorTheme.grey600)