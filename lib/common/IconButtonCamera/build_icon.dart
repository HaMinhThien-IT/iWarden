import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuildIcon extends StatelessWidget {
  final String assetIcon;
  final double width;
  final double height;
  final Color? color;
  const BuildIcon(
      {super.key,
      required this.assetIcon,
      required this.height,
      required this.width,
      this.color = Colors.white});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(10),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
      child: SvgPicture.asset(assetIcon),
    );
  }
}
