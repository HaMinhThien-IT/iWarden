import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/textTheme.dart';

class ToastSuccess extends StatelessWidget {
  final String msg;
  const ToastSuccess({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(left: BorderSide(color: ColorTheme.success))),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SvgPicture.asset("assets/svg/IconSuccess.svg"),
              const SizedBox(
                width: 10,
              ),
              Text(
                msg,
                style: CustomTextStyle.h6.copyWith(color: ColorTheme.success),
              )
            ],
          )),
    );
  }
}
