import 'package:flutter/material.dart';

Color _primary = const Color(0xFF3EB6E4);
Color _secondary = const Color(0xFFFFB600);
Color _danger = const Color(0xFFE01B00);

class ColorTheme {
  static const white = Color(0xFFFFFFFF);
  static const grey100 = Color(0xFFFAFAFA);
  static const grey200 = Color(0xFFF1F4F5);
  static const grey300 = Color(0xFFDDDDDD);
  static const grey400 = Color(0xFFC5C5C5);
  static const grey600 = Color(0xFF85858A);
  static const textPrimary = Color(0xFF292929);
  static final primary = _primary;
  static const darkPrimary = Color(0xFF1A2B6D);
  static const darkerPrimary = Color(0xFF051C2C);
  static final lighterPrimary = _primary.withOpacity(0.1);
  static final secondary = _secondary;
  static final lighterSecondary = _secondary.withOpacity(0.1);
  static final danger = _danger;
  static final lightDanger = _danger.withOpacity(0.1);
  static const success = Color(0xFF009D4F);
  static const lightSuccess = Color.fromRGBO(0, 157, 79, 0.1);
  static const boxShadow = Color.fromRGBO(0, 0, 0, 0.1);
  static const boxShadow2 = Color.fromRGBO(0, 0, 0, 0.7);
  static const boxShadow3 = Color.fromRGBO(0, 0, 0, 0.25);
  static const background = Color.fromRGBO(5, 28, 44, 1);
  static const backdrop = Color.fromRGBO(41, 41, 41, 0.5);
  static const backdrop2 = Color.fromRGBO(0, 0, 0, 0.18);
  static const mask = Color.fromRGBO(0, 0, 0, 0.5);
}
