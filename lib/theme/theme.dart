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
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: ColorTheme.darkPrimary),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: ColorTheme.primary,
        secondary: ColorTheme.secondary,
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
