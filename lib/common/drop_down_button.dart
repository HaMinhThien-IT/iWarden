import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:iWarden/models/date_filter.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';

class DropdownMenuItem2 {
  List<DropdownMenuItem<String>> addDividersAfterItems(List<DateFilter> items) {
    List<DropdownMenuItem<String>> menuItems = [];
    for (var item in items) {
      menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item.value.toString(),
            child: Text(
              item.label,
            ),
          ),
          // if (item != items.last)
          //   const DropdownMenuItem<String>(
          //     enabled: true,
          //     child: Divider(),
          //   ),
        ],
      );
    }
    return menuItems;
  }
}

class DropDownButtonWidget extends StatelessWidget {
  final Widget? labelText;
  final String hintText;
  final List<DropdownMenuItem<Object?>>? item;
  final void Function(Object?)? onchanged;
  final Object? value;
  final String? Function(Object?)? validator;
  final void Function(Object?)? onSaved;

  const DropDownButtonWidget(
      {this.labelText,
      required this.hintText,
      required this.item,
      required this.onchanged,
      required this.value,
      this.validator,
      this.onSaved,
      super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      decoration: InputDecoration(
        label: labelText,
        labelStyle:
            MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
          return TextStyle(
            color: states.contains(MaterialState.error)
                ? ColorTheme.danger
                : ColorTheme.textPrimary,
            fontSize: 18,
          );
        }),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 13,
        ),
        hintText: hintText,
        hintStyle: CustomTextStyle.body2.copyWith(
          color: ColorTheme.grey400,
        ),
        floatingLabelStyle:
            MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
          return TextStyle(
            color: states.contains(MaterialState.error)
                ? ColorTheme.danger
                : ColorTheme.textPrimary,
            fontSize: 18,
          );
        }),
      ),
      isExpanded: true,
      icon: const Icon(
        Icons.arrow_drop_down,
        color: ColorTheme.grey600,
      ),
      iconSize: 24,
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: ColorTheme.boxShadow3,
            offset: Offset(0, 5),
            blurRadius: 6,
          ),
        ],
        color: ColorTheme.white,
      ),
      items: item,
      onChanged: onchanged as dynamic,
      onSaved: onSaved as dynamic,
      value: value,
      validator: validator as dynamic,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      dropdownMaxHeight: 250,
      scrollbarAlwaysShow: true,
      scrollbarThickness: 6,
      offset: const Offset(0, -13),
      buttonPadding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 0,
      ),
      dropdownElevation: 0,
    );
  }
}
