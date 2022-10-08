import 'package:iWarden/models/location.dart';

class LocationController {
  final List<Location> _locations = [
    Location(label: 'New York', value: 'New York'),
    Location(label: 'London', value: 'London'),
    Location(label: 'HaNoi', value: 'HaNoi'),
    Location(label: 'Tokyo', value: 'Tokyo')
  ];

  Future<List<Location>> getAll() async {
    return _locations;
  }
}
