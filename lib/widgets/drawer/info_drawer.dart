import 'package:flutter/material.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';

class InfoDrawer extends StatelessWidget {
  final String name;
  final String assetImage;
  final String email;
  final bool isDrawer;
  const InfoDrawer(
      {Key? key,
      required this.assetImage,
      required this.name,
      required this.email,
      required this.isDrawer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: !isDrawer ? 64 : 56,
      backgroundColor: !isDrawer ? Colors.white : ColorTheme.darkPrimary,
      elevation: 0,
      title: ListTile(
        contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
        leading: SizedBox(
          width: 45,
          height: 45,
          child: CircleAvatar(
            backgroundImage: NetworkImage(assetImage),
          ),
        ),
        title: Text(
          name,
          style: CustomTextStyle.h6.copyWith(
            color: !isDrawer ? ColorTheme.textPrimary : Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          email,
          overflow: TextOverflow.ellipsis,
          style: CustomTextStyle.h6.copyWith(color: ColorTheme.grey600),
        ),
      ),
      automaticallyImplyLeading: false,
    );
  }
}
