import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

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
      hideSuggestionsOnKeyboardHide: false,
    );
  }
}
