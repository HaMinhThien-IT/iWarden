import 'package:flutter/foundation.dart';
import 'package:iWarden/controllers/LocationController.dart';
import 'package:iWarden/models/Location.dart';

class Locations with ChangeNotifier {
  var locationController = LocationController();

  Future<List<Location>> getLocationList() async {
    var locations = await locationController.getAll();
    return locations;
  }

  Future<List<Location>> onSuggest(String value) async {
    var locationList = await locationController.getAll();
    var locations = locationList
        .where(
          (location) => location.label.toLowerCase().contains(
                value.toLowerCase(),
              ),
        )
        .toList();
    return locations;
  }
}
