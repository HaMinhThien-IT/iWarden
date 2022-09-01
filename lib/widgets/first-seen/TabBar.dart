import 'package:flutter/material.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/textTheme.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text(
                  "Active (12)",
                  style: CustomTextStyle.h6.copyWith(color: ColorTheme.success),
                ),
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("It's cloudy here"),
            ),
            Center(
              child: Text("It's rainy here"),
            ),
          ],
        ),
      ),
    );
  }
}
