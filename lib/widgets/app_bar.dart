import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iWarden/theme/text_theme.dart';
import '../theme/color.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool automaticallyImplyLeading;
  const MyAppBar(
      {Key? key, required this.title, this.automaticallyImplyLeading = false})
      : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(54);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      titleSpacing: !automaticallyImplyLeading ? 15 : 0,
      title: SizedBox(
        child: Row(
          children: <Widget>[
            if (!automaticallyImplyLeading)
              SizedBox(
                width: 35,
                height: 35,
                child: Image.asset(
                  "assets/images/Logo.png",
                  fit: BoxFit.cover,
                ),
              ),
            if (!automaticallyImplyLeading)
              const SizedBox(
                width: 10,
              ),
            Text(
              title,
              style: CustomTextStyle.h4.copyWith(
                  color: ColorTheme.darkPrimary, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      leading: automaticallyImplyLeading
          ? IconButton(
              icon: SvgPicture.asset("assets/svg/IconBack.svg"),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      actions: [
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        )
      ],
    );
  }
}
