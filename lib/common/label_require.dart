import 'package:flutter/material.dart';

class LabelRequire extends StatelessWidget {
  final String labelText;
  const LabelRequire({required this.labelText, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          labelText,
          // style: CustomTextStyle.h5,
        ),
        const SizedBox(
          width: 5,
        ),
        const Text(
          '*',
          style: TextStyle(color: Colors.red),
        ),
      ],
    );
  }
}
