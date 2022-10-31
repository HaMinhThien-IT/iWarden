import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';

class PreviewImageItem extends StatelessWidget {
  final File? image;
  final String title;
  final VoidCallback? func;
  const PreviewImageItem(
      {required this.title,
      required this.image,
      required this.func,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title.length > 1 && image != null)
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: Stack(children: [
                SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Image.file(
                    image!,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  color: ColorTheme.mask,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                  child: InkWell(
                    onTap: func,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style:
                              CustomTextStyle.h6.copyWith(color: Colors.white),
                        ),
                        SvgPicture.asset("assets/svg/IconCameraPreview.svg")
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
      ],
    );
  }
}
