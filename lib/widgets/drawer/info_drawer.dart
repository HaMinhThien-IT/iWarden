import 'package:flutter/material.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';

class InfoDrawer extends StatelessWidget {
  final String name;
  final String assetImage;
  final String email;
  final String? location;
  final String? zone;
  final bool isDrawer;
  const InfoDrawer(
      {Key? key,
      required this.assetImage,
      required this.name,
      required this.email,
      required this.isDrawer,
      this.location,
      this.zone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: 16, vertical: !isDrawer ? 16 : 0),
      color: isDrawer ? ColorTheme.darkPrimary : Colors.white,
      child: ListTile(
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
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email: $email",
              maxLines: 2,
              // overflow: TextOverflow.ellipsis,
              style: CustomTextStyle.h6.copyWith(color: ColorTheme.grey600),
            ),
            if (!isDrawer)
              Text(
                "Location: ${location!}",
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyle.h6.copyWith(color: ColorTheme.grey600),
              ),
            if (!isDrawer)
              Text(
                "Zone: ${zone!}",
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyle.h6.copyWith(color: ColorTheme.grey600),
              ),
          ],
        ),
      ),
    );
  }
}
