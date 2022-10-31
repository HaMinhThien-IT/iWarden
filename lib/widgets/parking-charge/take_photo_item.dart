import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';

class TakePhotoItem extends StatelessWidget {
  final String title;
  final File? image;
  final bool state;
  final VoidCallback? func;
  const TakePhotoItem(
      {required this.title,
      required this.image,
      required this.state,
      this.func,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title.length > 1)
          InkWell(
            onTap: state ? func : null,
            child: Container(
              margin: const EdgeInsets.only(bottom: 8),
              color: state == true ? ColorTheme.lightSuccess : Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      if (image != null)
                        SvgPicture.asset(
                          "assets/svg/IconCompleteActive.svg",
                        ),
                      if (image == null)
                        const SizedBox(
                          width: 16,
                        ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        title,
                        style: CustomTextStyle.h6,
                      )
                    ],
                  ),
                  if (image != null)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Image.file(
                          image!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  if (image == null)
                    const SizedBox(
                      width: 40,
                      height: 40,
                    ),
                  if (state == true && image == null)
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: SvgPicture.asset("assets/svg/IconCamera3.svg"))
                ],
              ),
            ),
          ),
      ],
    );
  }
}
