import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iWarden/helpers/format_date.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';

class CardItemParkingCharge extends StatelessWidget {
  final String title;
  final String contravention;
  final DateTime created;
  final double fineAmount;

  const CardItemParkingCharge(
      {Key? key,
      required this.title,
      required this.contravention,
      required this.created,
      required this.fineAmount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      elevation: 0,
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: SizedBox(
            width: 72,
            height: 72,
            child: Image.network(
              "https://i.pinimg.com/originals/fa/eb/46/faeb46aac8f388c0b35977d4b0634cc2.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title.toUpperCase(),
              style: CustomTextStyle.h4,
            ),
            Row(
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/svg/IconLocation.svg"),
                ),
              ],
            )
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Contravention: $contravention",
              style: CustomTextStyle.h6.copyWith(color: ColorTheme.grey600),
            ),
            const SizedBox(height: 5),
            Text(
              "Created: ${FormatDate().getLocalDate(created)}",
              style: CustomTextStyle.h6.copyWith(color: ColorTheme.grey600),
            ),
            const SizedBox(height: 5),
            Text(
              "Fine Amount: $fineAmount\$",
              style: CustomTextStyle.h6.copyWith(color: ColorTheme.danger),
            ),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}
