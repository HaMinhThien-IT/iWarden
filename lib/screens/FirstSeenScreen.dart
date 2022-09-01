import 'package:flutter/material.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/textTheme.dart';
import 'package:iWarden/widgets/appBar.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';

class FirstSeenScreen extends StatefulWidget {
  static const routerName = '/first-seen';
  const FirstSeenScreen({Key? key}) : super(key: key);

  @override
  State<FirstSeenScreen> createState() => _FirstSeenScreenState();
}

class _FirstSeenScreenState extends State<FirstSeenScreen> {
  int currentIndexTab = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: currentIndexTab,
      length: 2,
      child: Scaffold(
          appBar: const MyAppBar(
            title: "First seen",
          ),
          drawer: const MyDrawer(),
          body: Column(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: ColorTheme.boxShadow,
                      spreadRadius: 5,
                      blurRadius: 15,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: TabBar(
                  onTap: (index) {
                    setState(() {
                      currentIndexTab = index;
                    });
                  },
                  tabs: <Widget>[
                    Tab(
                      child: Text(
                        "Active (12)",
                        style: CustomTextStyle.h6.copyWith(
                            color: currentIndexTab == 0
                                ? ColorTheme.success
                                : ColorTheme.grey600),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Expired (13)",
                        style: CustomTextStyle.h6.copyWith(
                            color: currentIndexTab == 1
                                ? ColorTheme.success
                                : ColorTheme.grey600),
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: <Widget>[
                    Center(
                      child: Text("It's cloudy here"),
                    ),
                    Center(
                      child: Text("It's rainy here"),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
