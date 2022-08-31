import 'package:flutter/material.dart';
import 'package:iwarden/theme/color.dart';
import 'package:iwarden/theme/textTheme.dart';

class InfoDrawer extends StatelessWidget {
  final String name;
  final String assetImage;
  final String email;
  const InfoDrawer(
      {Key? key,
      required this.assetImage,
      required this.name,
      required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorTheme.background,
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
          style: CustomTextStyle.h6,
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
