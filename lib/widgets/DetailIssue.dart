import 'package:flutter/material.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/textTheme.dart';

class DetailIssue extends StatelessWidget {
  const DetailIssue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.only(top: 16),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "bd5i smr".toUpperCase(),
                style: CustomTextStyle.h4,
              ),
              Text(
                "Color: White",
                style: CustomTextStyle.h6.copyWith(color: ColorTheme.grey600),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Make: Mercedes‑Benz",
                style: CustomTextStyle.h6.copyWith(color: ColorTheme.grey600),
              ),
              Text("Model: A‑Class",
                  style:
                      CustomTextStyle.h6.copyWith(color: ColorTheme.grey600)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Created at: 12/08/2022 12:20 pm ",
                style: CustomTextStyle.h6.copyWith(color: ColorTheme.grey600),
              ),
              Text("Bay: 12",
                  style:
                      CustomTextStyle.h6.copyWith(color: ColorTheme.grey600)),
            ],
          )
        ],
      ),
    );
  }
}
