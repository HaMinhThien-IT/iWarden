import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iWarden/common/bottom_sheet_2.dart';
import 'package:iWarden/common/drop_down_button.dart';
import 'package:iWarden/controllers/directions_repository_controller.dart';
import 'package:iWarden/models/directions.dart';
import 'package:iWarden/models/location.dart';
import 'package:iWarden/models/zone.dart';
import 'package:iWarden/providers/locations.dart';
import 'package:iWarden/screens/map-screen/map_screen.dart';
import 'package:iWarden/screens/read_regulation_screen.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';
import 'package:iWarden/widgets/drawer/info_drawer.dart';
import 'package:provider/provider.dart';

class LocationScreen extends StatefulWidget {
  static const routeName = '/location';
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final TextEditingController _locationText = TextEditingController();
  final TextEditingController _zoneText = TextEditingController();
  List<LocationWithZones> locationList = [];
  final Completer<GoogleMapController> _mapController = Completer();

  static const _sourceLocation = LatLng(12.675576, 108.035409);
  static const _destination = LatLng(12.679866, 108.044662);
  Directions? _info;

  void getLocationList(Locations locations) async {
    await locations.getLocationList().then((value) {
      setState(() {
        locationList = value;
      });
    });
  }

  Future<void> _goToDestination() async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: _sourceLocation,
          northeast: _destination,
        ),
        48,
      ),
    );
    final directions = await directionsRepository.getDirections(
        origin: _sourceLocation, destination: _destination);
    setState(() => _info = directions);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final locations = Provider.of<Locations>(context, listen: false);
      getLocationList(locations);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).viewPadding.top;
    final screenHeight = MediaQuery.of(context).size.height;
    final locations = Provider.of<Locations>(context);

    print(locations.location?.Name);
    print(locations.zone?.Name);

    void setZoneWhenSelectedLocation(LocationWithZones locationSelected) {
      locations.onSelectedZone(locationSelected.Zones!.isNotEmpty
          ? locationSelected.Zones![0]
          : null);
      _zoneText.text = locationSelected.Zones!.isNotEmpty
          ? locationSelected.Zones![0].Id.toString()
          : '';
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
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
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(
              bottom: 30,
            ),
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
                  isDrawer: false,
                ),
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
                      // SizedBox(
                      //   child: AutoCompleteWidget(
                      //     labelText: const Text('Location'),
                      //     hintText: 'Select location',
                      //     controller: _locationText,
                      //     onSuggestionSelected: (suggestion) {
                      //       setState(() {
                      //         _locationText.text =
                      //             (suggestion as LocationWithZones).Name;
                      //       });
                      //       locations.onSelectedLocation(
                      //           suggestion as LocationWithZones);
                      //     },
                      //     itemBuilder: (context, locationItem) {
                      //       return ItemDataComplete(
                      //         itemData: (locationItem as LocationWithZones).Name,
                      //       );
                      //     },
                      //     suggestionsCallback: (pattern) {
                      //       return locations.onSuggestLocation(pattern);
                      //     },
                      //   ),
                      // ),
                      SizedBox(
                        child: DropDownButtonWidget(
                          hintText: 'Select location',
                          item: locationList
                              .map(
                                (itemValue) => DropdownMenuItem(
                                  value: itemValue.Id.toString(),
                                  child: Text(
                                    itemValue.Name,
                                    style: CustomTextStyle.h5,
                                  ),
                                ),
                              )
                              .toList(),
                          onchanged: (value) {
                            setState(() {
                              _locationText.text = value as String;
                            });
                            LocationWithZones locationSelected =
                                locationList.firstWhere((item) =>
                                    item.Id == int.parse(value as String));
                            locations.onSelectedLocation(locationSelected);
                            setZoneWhenSelectedLocation(locationSelected);
                          },
                          value: _locationText.text.isNotEmpty
                              ? _locationText.text
                              : null,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        child: DropDownButtonWidget(
                          hintText: 'Select zone',
                          item: (locations.location?.Zones ?? [])
                              .map(
                                (itemValue) => DropdownMenuItem(
                                  value: itemValue.Id.toString(),
                                  child: Text(
                                    itemValue.Name,
                                    style: CustomTextStyle.h5,
                                  ),
                                ),
                              )
                              .toList(),
                          onchanged: (value) {
                            setState(() {
                              _zoneText.text = value as String;
                            });
                            Zone zoneSelected = locations.location!.Zones!
                                .firstWhere((item) =>
                                    item.Id == int.parse(value as String));
                            locations.onSelectedZone(zoneSelected);
                          },
                          value:
                              _zoneText.text.isNotEmpty ? _zoneText.text : null,
                        ),
                      ),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/svg/IconLocation2.svg",
                                    ),
                                    const SizedBox(
                                      width: 14,
                                    ),
                                    Text(
                                      "${_info?.totalDuration ?? '0 mins'} (${_info?.totalDistance ?? '0 km'})",
                                      style: CustomTextStyle.h4.copyWith(
                                        color: ColorTheme.primary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: _goToDestination,
                              child: Container(
                                padding: const EdgeInsets.all(14),
                                color: ColorTheme.darkPrimary,
                                child: SvgPicture.asset(
                                  "assets/svg/IconMaps.svg",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: MapScreen(
                          screenHeight: MediaQuery.of(context).size.width < 400
                              ? screenHeight / 2.5
                              : screenHeight / 1.5,
                          mapController: _mapController,
                          sourceLocation: _sourceLocation,
                          destination: _destination,
                          info: _info,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
