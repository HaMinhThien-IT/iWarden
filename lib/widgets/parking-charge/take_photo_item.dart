import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/theme/color.dart';

class TakePhotoItem extends StatelessWidget {
  const TakePhotoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                "assets/svg/IconCompleteActive.svg",
              ),
              const SizedBox(
                width: 12,
              ),
              const Text("Vehicle & Background")
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: Container(
              width: 40,
              height: 40,
              child: Image.asset(
                "assets/images/car.png",
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
