import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/theme/color.dart';

class ButtonScan extends StatelessWidget {
  final Function onTap;
  const ButtonScan({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorTheme.grey200,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.all(2.9),
      child: IconButton(
        onPressed: () => onTap,
        icon: SvgPicture.asset("assets/svg/IconScan.svg"),
      ),
    );
  }
}
