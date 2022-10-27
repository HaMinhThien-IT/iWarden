import 'package:flutter/material.dart';
import 'package:iWarden/theme/color.dart';

class NavItemMenu {
  final String title;
  final Widget icon;
  final String? route;
  final Color background;
  final bool? check;
  final VoidCallback? setCheck;
  NavItemMenu(this.title, this.icon, this.route, this.background, this.check,
      this.setCheck);
}
