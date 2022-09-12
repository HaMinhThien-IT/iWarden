import 'package:flutter/foundation.dart';
import 'package:iWarden/models/Location.dart';

class Locations with ChangeNotifier {
  final List<Location> _locations = [
    Location(label: 'New York', value: 'New York'),
    Location(label: 'London', value: 'London'),
    Location(label: 'HaNoi', value: 'HaNoi'),
    Location(label: 'Tokyo', value: 'Tokyo')
  ];

  List<Location> get locations {
    return [..._locations];
  }

  List<Location> onSuggest(String value) {
    var locations = _locations
        .where(
          (location) => location.label.toLowerCase().contains(
                value.toLowerCase(),
              ),
        )
        .toList();
    return locations;
  }
}
