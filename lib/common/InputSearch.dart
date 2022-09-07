import 'package:flutter/material.dart';
import 'package:iWarden/theme/color.dart';

class InputSearch extends StatelessWidget {
  final String hintText;

  const InputSearch({required this.hintText, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: ColorTheme.grey600,
        decoration: TextDecoration.none,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.all(15),
        fillColor: Colors.white,
        hintStyle: const TextStyle(
          color: ColorTheme.grey600,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: ColorTheme.grey300,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: ColorTheme.grey300,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        prefixIcon: const Icon(Icons.search),
      ),
    );
  }
}
