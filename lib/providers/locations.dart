import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:iWarden/controllers/location_controller.dart';
import 'package:iWarden/models/location.dart';

class Locations with ChangeNotifier {
  var locationController = LocationController();

  Future<List<LocationWithZones>> getLocationList() async {
    final locations = await locationController.getAll();
    return locations;
  }

  Future<List<LocationWithZones>> onSuggest(String value) async {
    final locationList = await locationController.getAll();
    final locations = locationList
        .where(
          (location) => location.Name.toLowerCase().contains(
            value.toLowerCase(),
          ),
        )
        .toList();
    return locations;
  }
}
