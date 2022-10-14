import 'package:flutter/material.dart';
import 'package:iWarden/common/autocomplete.dart';
import 'package:iWarden/models/location.dart';
import 'package:iWarden/providers/locations.dart';
import 'package:iWarden/widgets/drawer/model/data.dart';
import 'package:iWarden/widgets/drawer/model/menu_item.dart';
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

    List<Widget> getListNav() {
      return DataMenuItem()
          .navItem
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
        width: widthScreen > 400 ? widthScreen * 0.45 : widthScreen * 0.85,
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
                    ),
                    ClipRRect(
                      child: Container(
                          width: double.infinity,
                          height: heightScreen / checkScreen,
                          color: ColorTheme.darkPrimary,
                          child: Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: <Widget>[
                                Consumer<Locations>(
                                  builder: ((_, location, child) {
                                    return AutoCompleteWidget(
                                      labelColor: ColorTheme.white,
                                      fillColor: ColorTheme.darkPrimary,
                                      hintColor: ColorTheme.grey600,
                                      floatingLabelColor: ColorTheme.white,
                                      labelText: const Text('Location'),
                                      hintText: 'Select location',
                                      controller: _locationController,
                                      onSuggestionSelected: (suggestion) {
                                        setState(() {
                                          _locationController.text =
                                              (suggestion as Location).value;
                                        });
                                      },
                                      itemBuilder: (context, locationItem) {
                                        return ItemDataComplete(
                                          itemData:
                                              (locationItem as Location).label,
                                        );
                                      },
                                      suggestionsCallback: (pattern) {
                                        return location.onSuggest(pattern);
                                      },
                                    );
                                  }),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Consumer<Locations>(
                                  builder: ((_, location, child) {
                                    return AutoCompleteWidget(
                                      labelColor: ColorTheme.white,
                                      fillColor: ColorTheme.darkPrimary,
                                      hintColor: ColorTheme.grey600,
                                      floatingLabelColor: ColorTheme.white,
                                      labelText: const Text('Zone'),
                                      hintText: 'Select zone',
                                      controller: _locationController,
                                      onSuggestionSelected: (suggestion) {
                                        setState(() {
                                          _locationController.text =
                                              (suggestion as Location).value;
                                        });
                                      },
                                      itemBuilder: (context, locationItem) {
                                        return ItemDataComplete(
                                          itemData:
                                              (locationItem as Location).label,
                                        );
                                      },
                                      suggestionsCallback: (pattern) {
                                        return location.onSuggest(pattern);
                                      },
                                    );
                                  }),
                                ),
                              ],
                            ),
                          )),
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
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ItemMenuWidget(
                        itemMenu: ItemMenu(
                            "Check out", "assets/svg/CheckOut.svg", "checkout"),
                      ),
                    ),
                    SizedBox(height: heightScreen / 5),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
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
