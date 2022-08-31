import 'package:flutter/material.dart';

import 'package:iwarden/common/DropDownButton.dart';
import 'package:iwarden/widgets/appBar.dart';
import 'package:iwarden/widgets/drawer/app_drawer.dart';

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
