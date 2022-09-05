import 'package:flutter/material.dart';
import 'package:iWarden/common/AddImage.dart';
import 'package:iWarden/widgets/appBar.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';

class IssuePCNFirstSeenScreen extends StatelessWidget {
  static const routerName = '/issue-pcn';
  const IssuePCNFirstSeenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: MyAppBar(
            title: "Issue parking charge", automaticallyImplyLeading: true),
        drawer: MyDrawer(),
        body: AddImage());
  }
}
