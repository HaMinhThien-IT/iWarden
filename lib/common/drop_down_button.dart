import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';

class DropDownButton extends StatefulWidget {
  final String textLabel;
  final String hintLabel;
  const DropDownButton(
      {Key? key, required this.textLabel, required this.hintLabel})
      : super(key: key);

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  final List<String> genderItems = [
    'McDonald\'s Chesterfield...',
    'McDonald\'s Chesterfield...',
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      decoration: InputDecoration(
        label: Text(
          widget.textLabel,
          style: CustomTextStyle.h6.copyWith(color: Colors.white),
        ),
        labelStyle: CustomTextStyle.h5.copyWith(fontSize: 16),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 9),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorTheme.grey600, width: 2.0),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorTheme.grey600, width: 2.0),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      isExpanded: true,
      hint: Text(
        widget.hintLabel,
        overflow: TextOverflow.ellipsis,
        style: CustomTextStyle.h6.copyWith(color: Colors.white),
      ),
      icon: const Icon(
        Icons.arrow_drop_down,
        color: ColorTheme.grey600,
      ),
      iconSize: 24,
      buttonHeight: 45,
      // buttonPadding: const EdgeInsets.only(left: 20, right: 10),
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      items: genderItems
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyle.h6.copyWith(color: Colors.white),
                ),
              ))
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'Please select gender.';
        }
        return null;
      },
      onChanged: (value) {},
      onSaved: (value) {
        selectedValue = value.toString();
      },
    );
  }
}
