import 'package:flutter/material.dart';
import 'package:iWarden/widgets/appBar.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';

class AbortingScreen extends StatelessWidget {
  static const routeName = '/aborting';
  const AbortingScreen({Key? key}) : super(key: key);
  // final List<Map<String, bool>> data = [
  //   {
  //     'title'

  //   }
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: "Aborting",
        automaticallyImplyLeading: true,
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
          child: Container(
        color: Colors.white,
        margin: const EdgeInsets.only(top: 16),
      )),
    );
  }
}
