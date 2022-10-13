import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/common/bottom_sheet_2.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';
import 'package:iWarden/widgets/app_bar.dart';
import 'package:iWarden/widgets/detail_issue.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';
import 'package:iWarden/widgets/parking-charge/slider_image_parking.dart';

class ParkingChargeDetail extends StatelessWidget {
  static const routeName = '/parking-charge-detail';
  const ParkingChargeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(
          title: "Parking charge detail",
          automaticallyImplyLeading: true,
        ),
        drawer: const MyDrawer(),
        bottomSheet: BottomSheet2(
          buttonList: [
            BottomNavyBarItem(
              onPressed: () {},
              icon: SvgPicture.asset("assets/svg/IconCar.svg"),
              label: const Text(
                "Abort",
                style: CustomTextStyle.h6,
              ),
            ),
            BottomNavyBarItem(
              onPressed: () {},
              icon: SvgPicture.asset("assets/svg/IconPrinter.svg"),
              label: const Text(
                "Print",
                style: CustomTextStyle.h6,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const DetailIssue(
                borderBottom: true,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Contravention",
                      style: CustomTextStyle.h4,
                    ),
                    Text(
                      "Type: Overstaying time",
                      style: CustomTextStyle.h6
                          .copyWith(color: ColorTheme.grey600),
                    ),
                    Text(
                      "Amount: £160",
                      style:
                          CustomTextStyle.h6.copyWith(color: ColorTheme.danger),
                    ),
                    Text(
                      "Comment: Is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown ...",
                      style: CustomTextStyle.h6
                          .copyWith(color: ColorTheme.grey600),
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
              const SliderImageParking()
            ],
          ),
        ));
  }
}
