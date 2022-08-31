import 'package:flutter/material.dart';

import 'package:iWarden/common/DropDownButton.dart';
import 'package:iWarden/widgets/appBar.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';

class HomeOverview extends StatelessWidget {
  static const routerName = '/home';
  const HomeOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(),
    );
  }
}
