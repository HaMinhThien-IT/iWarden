import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';

class InfoDrawer extends StatelessWidget {
  final String name;
  final String assetImage;
  final String? location;
  final String? zone;
  final bool isDrawer;
  const InfoDrawer(
      {Key? key,
      required this.assetImage,
      required this.name,
      required this.isDrawer,
      this.location,
      this.zone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _buildAvatar() {
      if (isDrawer) {
        return Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 8, color: const Color.fromRGBO(255, 255, 255, 0.1)),
                borderRadius: BorderRadius.circular(30)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                assetImage,
                fit: BoxFit.cover,
              ),
            ));
      } else {
        return Container(
          width: 64,
          height: 64,
          alignment: Alignment.center,
          // decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [
          //   BoxShadow(
          //       color: ColorTheme.grey600, blurRadius: 0, spreadRadius: -2.5),
          //   BoxShadow(
          //     color: Colors.white,
          //     offset: Offset(-10, 15),
          //     blurRadius: 18,
          //     spreadRadius: 18,
          //   ),
          // ]),
          child: SizedBox(
            width: 48,
            height: 48,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                assetImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      }
    }

    return Container(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: !isDrawer ? 16 : 30,
          bottom: !isDrawer ? 16 : 10,
        ),
        color: isDrawer ? ColorTheme.darkPrimary : Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildAvatar(),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: CustomTextStyle.h6.copyWith(
                        color:
                            !isDrawer ? ColorTheme.textPrimary : Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    if (location != null)
                      Text(
                        "Location: ${location!}",
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyle.caption.copyWith(
                            color: !isDrawer
                                ? ColorTheme.textPrimary
                                : Colors.white),
                      ),
                    if (zone != null)
                      Text(
                        "Zone: ${zone!}",
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyle.caption.copyWith(
                            color: !isDrawer
                                ? ColorTheme.textPrimary
                                : Colors.white),
                      ),
                  ],
                )
              ],
            ),
            if (isDrawer)
              const SizedBox(
                height: 5,
              ),
            if (isDrawer)
              Container(
                margin: const EdgeInsets.only(left: 70),
                height: 26,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    icon: SvgPicture.asset(
                      "assets/svg/IconEndShift.svg",
                      width: 12,
                      color: ColorTheme.textPrimary,
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: ColorTheme.secondary,
                    ),
                    label: const Text(
                      "Check out",
                      style: CustomTextStyle.h6,
                    ),
                    onPressed: () {},
                  ),
                ),
              )
          ],
        ));
  }
}
// Container(
//           width: 500,
//           height: 500,
//           alignment: Alignment.center,
//           decoration: const BoxDecoration(
//               // border: Border.fromBorderSide(
//               //   BorderSide(color: Colors.black12),
//               // ),
//               shape: BoxShape.circle,
//               boxShadow: [
//                 BoxShadow(
//                     color: AppColor.grey600, blurRadius: 0, spreadRadius: -3),
//                 BoxShadow(
//                   color: Colors.white,
//                   offset: Offset(-8, 15),
//                   blurRadius: 18,
//                   spreadRadius: 15,
//                 ),
//               ]),
//           // child: Icon(Icons.pause, size: 70, color: Colors.black54),
//         ),