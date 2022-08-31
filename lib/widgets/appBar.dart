import 'package:flutter/material.dart';
import 'package:iwarden/theme/textTheme.dart';
import '../theme/color.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(54);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: SizedBox(
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 35,
              height: 35,
              child: Image.asset(
                "assets/images/Logo.png",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Home",
              style: CustomTextStyle.h4.copyWith(
                  color: ColorTheme.darkPrimary, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
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
