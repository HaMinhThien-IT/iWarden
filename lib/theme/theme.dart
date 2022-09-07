import 'package:flutter/material.dart';
import 'package:iWarden/theme/color.dart';

ThemeData themeMain() {
  return ThemeData(
      fontFamily: 'Poppins',
      drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.white,
      ),
      scaffoldBackgroundColor: ColorTheme.grey200,
      indicatorColor: ColorTheme.success,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: ColorTheme.darkPrimary),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: ColorTheme.primary,
        secondary: ColorTheme.secondary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(
          color: ColorTheme.grey600,
          fontSize: 14,
        ),
        labelStyle: const TextStyle(
          color: ColorTheme.textPrimary,
          fontSize: 14,
        ),
        floatingLabelStyle: const TextStyle(
          color: ColorTheme.textPrimary,
          fontSize: 18,
        ),
        contentPadding: const EdgeInsets.all(15),
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: ColorTheme.grey300,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: ColorTheme.grey300,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        filled: true,
        isDense: true,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.transparent;
          }
          return ColorTheme.grey600;
        }),
        checkColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.white;
          }
          return Colors.white;
        }),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.0),
        ),
      ));
}
