import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iWarden/helpers/format_date.dart';
import 'package:iWarden/models/first_seen.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';

class CardItem extends StatelessWidget {
  const CardItem(
      {Key? key,
      required this.expiring,
      required this.visited,
      required this.title,
      required this.type,
      required this.route})
      : super(key: key);

  final String title;
  final DateTime expiring;
  final DateTime visited;
  final TypeFirstSeen type;
  final String route;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(route, arguments: {'id': 1});
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        elevation: 0,
        semanticContainer: true,
        child: ListTile(
          // leading: ClipRRect(
          //   borderRadius: BorderRadius.circular(5.0),
          //   child: SizedBox(
          //     width: 72,
          //     height: 72,
          //     child: Image.network(
          //       "https://i.pinimg.com/originals/fa/eb/46/faeb46aac8f388c0b35977d4b0634cc2.jpg",
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title.toUpperCase(),
                style: CustomTextStyle.h4,
              ),
              Row(
                children: [
                  if (type == TypeFirstSeen.Expired)
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {},
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
                    constraints: const BoxConstraints(),
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/svg/IconLocation.svg"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/svg/IconCar.svg"),
                  ),
                ],
              )
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Expiring in: 2hr 3min",
                style: CustomTextStyle.h6.copyWith(color: ColorTheme.danger),
              ),
              Text(
                "Visited: ${FormatDate().getLocalDate(visited)}",
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
