import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonScan extends StatelessWidget {
  final Function onTap;
  const ButtonScan({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => onTap,
        icon: SvgPicture.asset("assets/svg/IconScan.svg"));
  }
}
