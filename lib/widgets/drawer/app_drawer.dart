import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/common/autocomplete.dart';
import 'package:iWarden/models/location.dart';
import 'package:iWarden/providers/locations.dart';
import 'package:iWarden/screens/home_overview.dart';
import 'package:iWarden/widgets/drawer/model/data.dart';
import 'package:iWarden/widgets/drawer/model/menu_item.dart';
import 'package:iWarden/widgets/drawer/model/nav_item.dart';
import 'package:iWarden/widgets/drawer/nav_item.dart';
import 'package:provider/provider.dart';
import '../../theme/color.dart';
import 'info_drawer.dart';
import 'item_menu_widget.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final TextEditingController _locationController = TextEditingController();
  bool check = false;

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    final checkScreen = heightScreen < 400 ? 2.5 : 5.0;
    List<Widget> getList() {
      return DataMenuItem()
          .data
          .map((e) => ItemMenuWidget(
                itemMenu: e,
              ))
          .toList();
    }

    List<NavItemMenu> navItem = [
      NavItemMenu(
          'Emerg. call',
          SvgPicture.asset(
            'assets/svg/IconCall2.svg',
          ),
          HomeOverview.routeName,
          ColorTheme.grey200,
          null,
          null),
      NavItemMenu('999', SvgPicture.asset('assets/svg/IconCall3.svg'),
          HomeOverview.routeName, ColorTheme.grey200, null, null),
      NavItemMenu(
          'Start break',
          SvgPicture.asset('assets/svg/IconStartBreak.svg'),
          HomeOverview.routeName,
          ColorTheme.lighterSecondary,
          check, () {
        setState(() {
          check = !check;
        });
      }),
    ];
    List<Widget> getListNav() {
      return navItem
          .map((e) => NavItem(
                itemMenu: e,
              ))
          .toList();
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SizedBox(
        width: widthScreen > 450 ? widthScreen * 0.45 : widthScreen * 0.85,
        child: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const InfoDrawer(
                      isDrawer: true,
                      assetImage:
                          "https://i.pinimg.com/originals/4d/86/5e/4d865ea47a8675d682ff35ad904a0af6.png",
                      email: "tom.smiths@ukparkingcontrol.com",
                      name: "Tom Smiths",
                      location: "Castlepoint Shopping centre",
                      zone: "Car park 1",
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: getList()),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ItemMenuWidget(
                        itemMenu: ItemMenu(
                            "End shift",
                            SvgPicture.asset("assets/svg/IconEndShift.svg"),
                            "checkout"),
                      ),
                    ),
                    SizedBox(height: heightScreen / 3.5),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 30,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: getListNav()),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
