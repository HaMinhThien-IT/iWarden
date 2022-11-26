import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';

class AutoCompleteWidget2 extends StatelessWidget {
  final Widget labelText;
  final String? hintText;
  final DropdownEditingController<String>? controller;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  Color? labelColor = ColorTheme.textPrimary;
  Color? fillColor = ColorTheme.white;
  Color? hintColor = ColorTheme.grey400;
  Color? floatingLabelColor = ColorTheme.textPrimary;

  AutoCompleteWidget2({
    required this.labelText,
    this.hintText,
    this.validator,
    this.controller,
    this.onSaved,
    this.labelColor,
    this.fillColor,
    this.hintColor,
    this.floatingLabelColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextDropdownFormField(
      options: const ["Male", "Female"],
      decoration: InputDecoration(
        fillColor: fillColor ?? ColorTheme.white,
        label: labelText,
        labelStyle:
            MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
          return TextStyle(
            color: states.contains(MaterialState.error)
                ? ColorTheme.danger
                : labelColor ?? ColorTheme.textPrimary,
            fontSize: 18,
          );
        }),
        hintText: hintText,
        hintStyle: CustomTextStyle.body2.copyWith(
          color: hintColor ?? ColorTheme.grey400,
        ),
        floatingLabelStyle:
            MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
          return TextStyle(
            color: states.contains(MaterialState.error)
                ? ColorTheme.danger
                : floatingLabelColor ?? ColorTheme.textPrimary,
            fontSize: 18,
          );
        }),
        suffixIcon: const Icon(
          Icons.expand_more_outlined,
          size: 20,
          color: ColorTheme.grey600,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 13,
        ),
      ),
      dropdownHeight: 120,
      controller: controller,
    );
  }
}
