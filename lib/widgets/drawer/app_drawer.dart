import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/common/autocomplete.dart';
import 'package:iWarden/models/location.dart';
import 'package:iWarden/providers/auth.dart';
import 'package:iWarden/screens/home_overview.dart';
import 'package:iWarden/screens/login_screens.dart';
import 'package:iWarden/widgets/drawer/model/data.dart';
import 'package:iWarden/widgets/drawer/model/menu_item.dart';
import 'package:iWarden/widgets/drawer/model/nav_item.dart';
import 'package:iWarden/widgets/drawer/nav_item.dart';
import 'package:iWarden/widgets/drawer/spot_check.dart';
import 'package:provider/provider.dart';
import '../../theme/color.dart';
import 'info_drawer.dart';
import 'item_menu_widget.dart';
import 'package:url_launcher/url_launcher.dart';

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
    final Uri smsLaunchUri = Uri(
      scheme: 'sms',
      path: '0118 999 881 999 119 7253',
      queryParameters: <String, String>{
        'body': Uri.encodeComponent('Example Subject & Symbols are allowed!'),
      },
    );
    List<Widget> getList() {
      return DataMenuItem()
          .data
          .map((e) => ItemMenuWidget(
                itemMenu: e,
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed(e.route!),
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
          null, () async {
        final call = Uri.parse('tel:0981832226');
        if (await canLaunchUrl(call)) {
          launchUrl(call);
        } else {
          throw 'Could not launch $call';
        }
      }),
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

    final authProvider = Provider.of<Auth>(context);

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
                      assetImage: "assets/images/avatar.png",
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
                        children: getList(),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SpotCheck(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ItemMenuWidget(
                        itemMenu: ItemMenu(
                          "End shift",
                          'assets/svg/IconEndShift.svg',
                          null,
                        ),
                        onTap: () {
                          authProvider.logout();
                          Navigator.of(context).pushReplacementNamed(
                            LoginScreen.routeName,
                          );
                        },
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
