import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iwarden/theme/color.dart';
import 'package:iwarden/theme/textTheme.dart';
import 'package:iwarden/widgets/drawer/model/MenuItem.dart';

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
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: activeRoute()
            ? ColorTheme.lightPrimary
            : itemMenu.title == "Check out"
                ? ColorTheme.grey200
                : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: SvgPicture.asset(
          itemMenu.assetIcon,
          width: 24,
          height: 24,
          color: activeRoute()
              ? ColorTheme.darkPrimary
              : itemMenu.title == "Check out"
                  ? ColorTheme.danger
                  : ColorTheme.grey600,
        ),
        title: Transform.translate(
          offset: const Offset(-16, 0),
          child: Text(
            itemMenu.title,
            style: CustomTextStyle.h5.copyWith(
                color: activeRoute()
                    ? ColorTheme.darkPrimary
                    : ColorTheme.grey600),
          ),
        ),
        onTap: () {
          Navigator.of(context).pushReplacementNamed(itemMenu.route);
        },
      ),
    );
  }
}
