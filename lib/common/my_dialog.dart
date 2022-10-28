import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';

class MyDialog extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget func;
  const MyDialog({
    required this.title,
    required this.subTitle,
    required this.func,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: AlertDialog(
        insetPadding: const EdgeInsets.all(20),
        contentPadding: EdgeInsets.zero,
        title: Text(
          title,
          style: CustomTextStyle.h4,
          textAlign: TextAlign.center,
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              const SizedBox(
                height: 8,
              ),
              Text(
                subTitle,
                style: CustomTextStyle.h5.copyWith(
                  color: ColorTheme.grey600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              )
            ],
          ),
        ),
        actions: <Widget>[
          Center(
            child: func,
          ),
          const SizedBox(
            height: 4,
          )
        ],
      ),
    );
  }
}
