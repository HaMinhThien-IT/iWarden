import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';

class PreviewImageItem extends StatelessWidget {
  const PreviewImageItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(3),
        child: Stack(children: [
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/images/car.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: ColorTheme.mask,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Vehicle & Background",
                  style: CustomTextStyle.h6.copyWith(color: Colors.white),
                ),
                SvgPicture.asset("assets/svg/IconCameraPreview.svg")
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
