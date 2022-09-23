import 'package:flutter/material.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/textTheme.dart';

class MyAlertDialog extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget func;
  const MyAlertDialog(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.func});
  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: CustomTextStyle.h4,
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  subTitle,
                  style: CustomTextStyle.h5.copyWith(color: ColorTheme.grey600),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Center(
              child: func,
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          onPressed: () => _showMyDialog(context),
          child: const Text("ok show")),
    );
  }
}
