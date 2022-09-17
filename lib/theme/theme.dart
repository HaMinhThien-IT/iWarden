import 'package:flutter/material.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/textTheme.dart';

ThemeData themeMain() {
  return ThemeData(
    fontFamily: 'Poppins',
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.white,
    ),
    scaffoldBackgroundColor: ColorTheme.grey200,
    indicatorColor: ColorTheme.success,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: ColorTheme.darkPrimary),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: ColorTheme.primary,
      secondary: ColorTheme.secondary,
    ),
    scrollbarTheme: const ScrollbarThemeData().copyWith(
        crossAxisMargin: -8,
        thumbColor: MaterialStateProperty.all(ColorTheme.darkPrimary),
        radius: const Radius.circular(3)),
    checkboxTheme: CheckboxThemeData(
      fillColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.transparent;
        }
        return ColorTheme.grey600;
      }),
      checkColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.white;
        }
        return Colors.white;
      }),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3.0),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      helperStyle: CustomTextStyle.body2.copyWith(color: ColorTheme.danger),
      hintStyle: CustomTextStyle.body1.copyWith(
        color: ColorTheme.grey600,
      ),
      // suffixStyle: TextStyle(
      //   color: ColorTheme.danger,
      //   fontSize: 14,
      // ),
      labelStyle: const TextStyle(
        color: ColorTheme.textPrimary,
        fontSize: 18,
      ),
      floatingLabelStyle: const TextStyle(
        color: ColorTheme.textPrimary,
        fontSize: 18,
      ),
      alignLabelWithHint: true,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: const EdgeInsets.all(13),
      fillColor: ColorTheme.white,
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
  );
}
