import 'package:flutter/material.dart';
import 'package:iWarden/helpers/format_date.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';

class DetailCar extends StatelessWidget {
  final String plate;
  final DateTime created;
  final String? color;
  final String? model;

  const DetailCar({
    required this.plate,
    required this.created,
    this.color,
    this.model,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
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
                style: CustomTextStyle.h3,
              ),
              Text("Color: $color",
                  style:
                      CustomTextStyle.h6.copyWith(color: ColorTheme.grey600)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Created at: ${FormatDate().getLocalDate(created)}",
                style: CustomTextStyle.h6.copyWith(color: ColorTheme.grey600),
              ),
              Text("Model: ${model ?? "No data"}",
                  style:
                      CustomTextStyle.h6.copyWith(color: ColorTheme.grey600)),
            ],
          ),
        ],
      ),
    );
  }
}
