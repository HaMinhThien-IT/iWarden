import 'package:flutter/material.dart';
import 'package:iWarden/theme/color.dart';

class ButtonSheet extends StatelessWidget {
  const ButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: ColorTheme.grey300,
          ),
        ),
      ),
    );
  }
}
