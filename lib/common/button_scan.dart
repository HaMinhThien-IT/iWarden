import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/theme/color.dart';

class ButtonScan extends StatelessWidget {
  final VoidCallback onTap;
  const ButtonScan({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: ColorTheme.primary,
      child: Container(
        decoration: BoxDecoration(
          color: ColorTheme.grey200,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.all(14),
        child: SvgPicture.asset("assets/svg/IconScan.svg"),
      ),
    );
  }
}
