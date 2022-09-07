import 'package:flutter/material.dart';

Color _primary = const Color(0xFF3EB6E4);
Color _secondary = const Color(0xFFFFB600);
Color _danger = const Color(0xFFE01B00);

class ColorTheme {
  static const grey100 = Color(0xFFFAFAFA);
  static const grey200 = Color(0xFFF1F4F5);
  static const grey300 = Color(0xFFDDDDDD);
  static const grey400 = Color(0xFFC5C5C5);
  static const grey600 = Color(0xFF85858A);
  static final primary = _primary;
  static final secondary = _secondary;
  static final lightSecondary = _secondary.withOpacity(0.1);
  static final lighterSecondary = _secondary.withOpacity(0.1);
  static final danger = _danger;
  static final lightDanger = _danger.withOpacity(0.1);
  static const success = Color(0xFF009D4F);
  static final darkPrimary = _primary.withOpacity(1);
  static final lightPrimary = _primary.withOpacity(0.1);
  static final lighterPrimary = _primary.withOpacity(0.1);
  static const textPrimary = Color(0xFF292929);
  static const boxShadow = Color.fromRGBO(0, 0, 0, 0.1);
  static const boxShadow2 = Color.fromRGBO(0, 0, 0, 0.7);
  static const background = Color.fromRGBO(5, 28, 44, 1);
}
