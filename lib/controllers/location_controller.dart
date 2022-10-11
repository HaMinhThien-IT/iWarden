import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:iWarden/models/location.dart';
import 'package:http/http.dart' as http;

class LocationController {
  // final List<Location> _locations = [
  //   Location(id: '1', label: 'New York', value: 'New York'),
  //   Location(id: '2', label: 'London', value: 'London'),
  //   Location(id: '3', label: 'HaNoi', value: 'HaNoi'),
  //   Location(id: '4', label: 'Tokyo', value: 'Tokyo')
  // ];

  static List<Location> parseLocation(String responseBody) {
    var list = jsonDecode(responseBody) as List<dynamic>;
    List<Location> locations =
        list.map((model) => Location.fromJson(model)).toList();
    return locations;
  }

  Future<List<Location>> getAll() async {
    var response = await http.get(
        Uri.https('63423fd2ba4478d4783996e6.mockapi.io', 'api/demo/locations'));
    // List<Location> jsonData = jsonDecode(response.body);
    // List<Location> locations = [];
    // for (var lc in jsonData) {
    //   Location location =
    //       Location(id: lc["id"], label: lc["label"], value: lc["value"]);
    //   locations.add(location);
    // }
    return compute(parseLocation, response.body);
  }
}
