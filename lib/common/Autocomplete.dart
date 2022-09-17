import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:iWarden/theme/color.dart';

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
  final String labelText;
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
  Color? hintColor = ColorTheme.grey600;
  Color? floatingLabelColor = ColorTheme.textPrimary;

  AutoCompleteWidget(
      {required this.labelText,
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
      super.key});

  @override
  Widget build(BuildContext context) {
    return TypeAheadFormField(
      textFieldConfiguration: TextFieldConfiguration(
        style: TextStyle(
          color: labelColor,
          fontSize: 14,
        ),
        decoration: InputDecoration(
          fillColor: fillColor,
          labelText: labelText,
          labelStyle: TextStyle(
            color: labelColor,
            fontSize: 18,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: hintColor,
          ),
          floatingLabelStyle: TextStyle(
            color: floatingLabelColor,
            fontSize: 18,
          ),
          suffixIcon: const Icon(
            Icons.expand_more_outlined,
            size: 24,
            color: ColorTheme.grey600,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 0,
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
    );
  }
}
