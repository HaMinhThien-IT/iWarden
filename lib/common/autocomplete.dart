import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';

class ItemDataComplete extends StatelessWidget {
  final String itemData;
  const ItemDataComplete({required this.itemData, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 0,
          ),
          visualDensity: const VisualDensity(
            horizontal: 0,
            vertical: -2,
          ),
          dense: true,
          title: Text(
            itemData,
          ),
        ),
        const Divider(
          height: 0,
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class AutoCompleteWidget extends StatelessWidget {
  final Widget labelText;
  final String? hintText;
  final Function(Object?) onSuggestionSelected;
  final Widget Function(BuildContext, Object?) itemBuilder;
  final Function(String) suggestionsCallback;
  final String? initialValue;
  final String? Function(String?)? validator;
  final Widget Function(BuildContext, Object?)? errorBuilder;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  Color? labelColor = ColorTheme.textPrimary;
  Color? fillColor = ColorTheme.white;
  Color? hintColor = ColorTheme.grey400;
  Color? floatingLabelColor = ColorTheme.textPrimary;

  AutoCompleteWidget({
    required this.labelText,
    this.hintText,
    required this.onSuggestionSelected,
    required this.itemBuilder,
    required this.suggestionsCallback,
    this.initialValue,
    this.validator,
    this.errorBuilder,
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
    return TypeAheadFormField(
      textFieldConfiguration: TextFieldConfiguration(
        style: TextStyle(
          color: labelColor ?? ColorTheme.textPrimary,
          fontSize: 12,
        ),
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
        controller: controller,
      ),
      onSuggestionSelected: onSuggestionSelected,
      itemBuilder: itemBuilder,
      suggestionsCallback: suggestionsCallback as dynamic,
      initialValue: initialValue,
      validator: validator,
      errorBuilder: errorBuilder,
      noItemsFoundBuilder: (value) {
        return const Padding(
          padding: EdgeInsets.all(12),
          child: Text('No Items Found!'),
        );
      },
      onSaved: onSaved,
      hideSuggestionsOnKeyboardHide: true,
      suggestionsBoxDecoration: SuggestionsBoxDecoration(
        elevation: 1,
        borderRadius: BorderRadius.circular(5),
        color: ColorTheme.white,
      ),
      hideOnLoading: true,
      transitionBuilder: (context, suggestionsBox, animationController) =>
          FadeTransition(
        opacity: CurvedAnimation(
          parent: animationController as Animation<double>,
          curve: Curves.fastLinearToSlowEaseIn,
        ),
        child: suggestionsBox,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enabled: false,
    );
  }
}
