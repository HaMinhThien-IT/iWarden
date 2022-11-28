import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iWarden/helpers/format_date.dart';
import 'package:iWarden/models/first_seen.dart';
import 'package:iWarden/models/vehicle_information.dart';
import 'package:iWarden/screens/first-seen/active_first_seen_screen.dart';
import 'package:iWarden/screens/parking-charges/issue_pcn_first_seen.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';

class CardItem extends StatelessWidget {
  final VehicleInformation vehicleInfo;
  final int expiring;
  final TypeFirstSeen type;
  final String route;
  final Function onCarLeft;

  const CardItem({
    Key? key,
    required this.vehicleInfo,
    required this.expiring,
    required this.type,
    required this.route,
    required this.onCarLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calculateTime = CalculateTime();

    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushReplacementNamed(route, arguments: vehicleInfo);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        elevation: 0,
        semanticContainer: true,
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                vehicleInfo.Plate.toUpperCase(),
                style: CustomTextStyle.h4,
              ),
              Row(
                children: [
                  if (type == TypeFirstSeen.Expired)
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints:
                          const BoxConstraints(minWidth: 40, minHeight: 40),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          IssuePCNFirstSeenScreen.routeName,
                          arguments: vehicleInfo,
                        );
                      },
                      icon: SvgPicture.asset(
                        "assets/svg/IconCharges2.svg",
                      ),
                    ),
                  if (type == TypeFirstSeen.Expired)
                    const SizedBox(
                      width: 10,
                    ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints:
                        const BoxConstraints(minWidth: 40, minHeight: 40),
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/svg/IconLocation.svg",
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints:
                        const BoxConstraints(minWidth: 40, minHeight: 40),
                    onPressed: () {
                      onCarLeft();
                    },
                    icon: SvgPicture.asset("assets/svg/IconCar.svg"),
                  ),
                ],
              ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (type == TypeFirstSeen.Expired)
                Text(
                  "Expired in: ${calculateTime.getDurationExpiredIn(Duration(minutes: expiring))} ago",
                  style: CustomTextStyle.h6.copyWith(color: ColorTheme.danger),
                ),
              if (type == TypeFirstSeen.Active)
                Text(
                  "Expiring in: ${calculateTime.getDuration(Duration(minutes: expiring))}",
                  style: CustomTextStyle.h6.copyWith(color: ColorTheme.danger),
                ),
              Text(
                "Visited at: ${FormatDate().getLocalDate(vehicleInfo.Created as DateTime)}",
                style: CustomTextStyle.h6.copyWith(color: ColorTheme.grey600),
              )
            ],
          ),
          isThreeLine: true,
        ),
      ),
    );
  }
}
