import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iWarden/common/autocomplete.dart';
import 'package:iWarden/common/bottom_sheet_2.dart';
import 'package:iWarden/models/location.dart';
import 'package:iWarden/providers/locations.dart';
import 'package:iWarden/screens/read_regulation_screen.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';
import 'package:iWarden/widgets/drawer/info_drawer.dart';
import 'package:iWarden/widgets/location/tab_bar_item.dart';
import 'package:provider/provider.dart';

class LocationScreen extends StatefulWidget {
  static const routeName = '/location';
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final TextEditingController _typeAheadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    var heightStatusBar = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      bottomSheet: BottomSheet2(buttonList: [
        BottomNavyBarItem(
          onPressed: () {
            Navigator.of(context).pushNamed(ReadRegulationScreen.routeName);
          },
          icon: SvgPicture.asset('assets/svg/IconNext.svg'),
          label: Text(
            'Next',
            style: CustomTextStyle.h6.copyWith(
              color: ColorTheme.grey600,
            ),
          ),
        ),
      ]),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              const InfoDrawer(
                  assetImage: "assets/images/avatar.png",
                  name: "Hello Tom Smiths",
                  location: null,
                  zone: null,
                  isDrawer: false),
              Container(
                margin: const EdgeInsets.only(top: 8),
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Please select your location for this shift',
                        style: CustomTextStyle.body1),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      child: Consumer<Locations>(
                        builder: ((_, location, child) {
                          return AutoCompleteWidget(
                            labelText: const Text('Location'),
                            hintText: 'Select location',
                            controller: _typeAheadController,
                            onSuggestionSelected: (suggestion) {
                              setState(() {
                                _typeAheadController.text =
                                    (suggestion as LocationWithZones)
                                        .Id
                                        .toString();
                              });
                            },
                            itemBuilder: (context, locationItem) {
                              return ItemDataComplete(
                                itemData:
                                    (locationItem as LocationWithZones).Name,
                              );
                            },
                            suggestionsCallback: (pattern) {
                              return location.onSuggest(pattern);
                            },
                          );
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // SizedBox(
                    //   child: Consumer<Locations>(
                    //     builder: ((_, location, child) {
                    //       return AutoCompleteWidget(
                    //         labelText: const Text('Zone'),
                    //         hintText: 'Select zone',
                    //         controller: _typeAheadController,
                    //         onSuggestionSelected: (suggestion) {
                    //           setState(() {
                    //             _typeAheadController.text =
                    //                 (suggestion as Location).value;
                    //           });
                    //         },
                    //         itemBuilder: (context, locationItem) {
                    //           return ItemDataComplete(
                    //             itemData: (locationItem as Location).label,
                    //           );
                    //         },
                    //         suggestionsCallback: (pattern) {
                    //           return location.onSuggest(pattern);
                    //         },
                    //       );
                    //     }),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 24,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 9,
                            child: Container(
                              padding: const EdgeInsets.all(14),
                              color: ColorTheme.lighterPrimary,
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/svg/IconLocation2.svg",
                                  ),
                                  const SizedBox(
                                    width: 14,
                                  ),
                                  Text(
                                    "15min (4.6km)",
                                    style: CustomTextStyle.h4
                                        .copyWith(color: ColorTheme.primary),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(14),
                            color: ColorTheme.darkPrimary,
                            child: SvgPicture.asset("assets/svg/IconMaps.svg"),
                          ),
                        ],
                      ),
                    )
                    // TabbarItem(
                    //   sites: siteList,
                    // ),
                  ],
                ),
              ),
              //
            ],
          ),
        ),
      ),
    );
  }
}
