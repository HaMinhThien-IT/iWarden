import 'package:flutter/material.dart';
import 'package:iWarden/helpers/format_date.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';

class DetailIssue extends StatelessWidget {
  final bool borderBottom;
  final String plate;
  final DateTime createdAt;
  final String bayNumber;

  const DetailIssue({
    Key? key,
    this.borderBottom = false,
    required this.plate,
    required this.createdAt,
    required this.bayNumber,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: borderBottom
              ? const Border(
                  bottom: BorderSide(width: 1, color: ColorTheme.grey300))
              : null),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.only(top: 8),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                plate.toUpperCase(),
                style: CustomTextStyle.h4,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Created at: ${FormatDate().getLocalDate(createdAt)}",
                style: CustomTextStyle.h6.copyWith(color: ColorTheme.grey600),
              ),
              Text(
                "Bay: $bayNumber",
                style: CustomTextStyle.h6.copyWith(
                  color: ColorTheme.grey600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
