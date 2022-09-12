import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

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

  const AutoCompleteWidget(
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
      super.key});

  @override
  Widget build(BuildContext context) {
    return TypeAheadFormField(
      textFieldConfiguration: TextFieldConfiguration(
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          suffixIcon: const Icon(
            Icons.expand_more_outlined,
            size: 24,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
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
          padding: EdgeInsets.all(15),
          child: Text('No Items Found!'),
        );
      },
      onSaved: onSaved,
      hideSuggestionsOnKeyboardHide: true,
    );
  }
}
