import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/textTheme.dart';
import 'package:iWarden/widgets/appBar.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';

class MyTabBar extends StatefulWidget {
  final String titleAppBar;
  final Function funcAdd;
  final Function funcRefresh;
  final Widget tabBarViewTab1;
  final Widget tabBarViewTab2;
  final int quantityActive;
  final int quantityExpired;
  const MyTabBar(
      {Key? key,
      required this.titleAppBar,
      required this.funcAdd,
      required this.funcRefresh,
      required this.tabBarViewTab1,
      required this.tabBarViewTab2,
      required this.quantityActive,
      required this.quantityExpired})
      : super(key: key);

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  int currentIndexTab = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: currentIndexTab,
      length: 2,
      child: Scaffold(
        appBar: MyAppBar(
          title: widget.titleAppBar,
        ),
        bottomSheet: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 1, color: ColorTheme.grey300),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextButton.icon(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/svg/IconPlus.svg"),
                    label: const Text(
                      "Add first seen",
                      style: CustomTextStyle.h6,
                    )),
                Container(
                  height: 25,
                  decoration: const BoxDecoration(
                      border: Border.symmetric(
                          vertical: BorderSide(
                              width: 0.5, color: ColorTheme.grey300))),
                ),
                TextButton.icon(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/svg/IconRefresh.svg"),
                    label: const Text(
                      "Refresh list",
                      style: CustomTextStyle.h6,
                    )),
              ],
            ),
          ),
        ),
        drawer: const MyDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 20),
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
                      "Active (${widget.quantityActive})",
                      style: CustomTextStyle.h6.copyWith(
                          color: currentIndexTab == 0
                              ? ColorTheme.success
                              : ColorTheme.grey600),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Expired  (${widget.quantityExpired})",
                      style: CustomTextStyle.h6.copyWith(
                          color: currentIndexTab == 1
                              ? ColorTheme.success
                              : ColorTheme.grey600),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  widget.tabBarViewTab1,
                  widget.tabBarViewTab2
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
