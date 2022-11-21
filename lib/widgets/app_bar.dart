import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iWarden/theme/text_theme.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool automaticallyImplyLeading;
  final VoidCallback? onRedirect;

  const MyAppBar({
    Key? key,
    required this.title,
    this.automaticallyImplyLeading = false,
    this.onRedirect,
  }) : super(key: key);

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
              SvgPicture.asset("assets/svg/LogoHome.svg"),
            if (!automaticallyImplyLeading)
              const SizedBox(
                width: 10,
              ),
            Text(
              title,
              style: CustomTextStyle.h4.copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      leading: automaticallyImplyLeading
          ? IconButton(
              icon: SvgPicture.asset("assets/svg/IconBack.svg"),
              onPressed: onRedirect ?? () => Navigator.of(context).pop(),
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
