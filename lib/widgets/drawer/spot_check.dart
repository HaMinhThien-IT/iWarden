import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iWarden/common/Camera/camera_picker.dart';
import 'package:iWarden/controllers/evidence_photo_controller.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';
import 'package:iWarden/widgets/drawer/model/menu_item.dart';

class SpotCheck extends StatefulWidget {
  const SpotCheck({
    Key? key,
  }) : super(key: key);

  @override
  State<SpotCheck> createState() => _SpotCheckState();
}

class _SpotCheckState extends State<SpotCheck> {
  final evidencePhotoController = EvidencePhotoController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
      ),
      child: InkWell(
        onTap: () async {
          final results = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CameraPicker(
                titleCamera: "Spot check",
                front: true,
                onDelete: (file) {
                  return true;
                },
              ),
            ),
          );
          if (results != null) {
            // print(results[0]);
            await evidencePhotoController.uploadImage(results[0]);
          }
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: SvgPicture.asset('assets/svg/IconSpotCheck.svg'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                "Spot check",
                style:
                    CustomTextStyle.h6.copyWith(color: ColorTheme.textPrimary),
              ),
            )
          ],
        ),
      ),
    );
  }
}
//  color: itemMenu.route == "checkout"
//                         ? ColorTheme.danger
//                         : activeRoute()
//                             ? ColorTheme.darkPrimary
//                             : ColorTheme.grey600)