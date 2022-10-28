import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';

class DropDownButtonWidget extends StatelessWidget {
  final Widget labelText;
  final String hintText;
  final List<DropdownMenuItem<Object?>>? item;
  final void Function(Object?)? onchanged;
  final Object? value;

  const DropDownButtonWidget(
      {required this.labelText,
      required this.hintText,
      required this.item,
      required this.onchanged,
      required this.value,
      super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      decoration: InputDecoration(
        label: labelText,
        labelStyle: CustomTextStyle.h5.copyWith(fontSize: 16),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 13,
        ),
        hintText: hintText,
      ),
      isExpanded: true,
      icon: const Icon(
        Icons.arrow_drop_down,
        color: ColorTheme.grey600,
      ),
      iconSize: 24,
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      items: item,
      // onChanged: onchanged,
      value: value,
    );
  }
}
