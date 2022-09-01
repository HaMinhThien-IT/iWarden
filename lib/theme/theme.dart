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
        iconTheme: IconThemeData(color: ColorTheme.darkPrimary)),
    // tabBarTheme: ,
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(primary: ColorTheme.primary, secondary: ColorTheme.secondary),
  );
}
