import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iWarden/common/Autocomplete.dart';
import 'package:iWarden/models/Location.dart';
import 'package:iWarden/providers/locations.dart';
import 'package:iWarden/widgets/drawer/model/Data.dart';
import 'package:iWarden/widgets/drawer/model/MenuItem.dart';
import 'package:provider/provider.dart';
import '../../theme/color.dart';
import '../../theme/textTheme.dart';
import '../../common/DropDownButton.dart';
import '../../widgets/drawer/InfoDrawer.dart';
import '../../widgets/drawer/ItemMenuWidget.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final checkScreen = heightScreen < 400 ? 2.5 : 5;
    List<Widget> getList() {
      return DataMenuItem()
          .data
          .map((e) => ItemMenuWidget(
                itemMenu: e,
              ))
          .toList();
    }

    return ClipRRect(
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
                      name: "Tom Smiths"),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0)),
                    child: Container(
                        width: double.infinity,
                        height: heightScreen / checkScreen,
                        decoration:
                            const BoxDecoration(color: ColorTheme.background),
                        child: Container(
                          margin: const EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: <Widget>[
                              Consumer<Locations>(
                                builder: ((_, location, child) {
                                  return AutoCompleteWidget(
                                    labelText: 'Location',
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
                                height: 25,
                              ),
                              // DropDownButton(
                              //     textLabel: "Zone",
                              //     hintLabel: "McDonalds Chesterfield..."),
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(children: getList()),
                  ),
                  SizedBox(
                    height: heightScreen / 9,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ItemMenuWidget(
                      itemMenu: ItemMenu(
                          "Check out", "assets/svg/CheckOut.svg", "route"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
