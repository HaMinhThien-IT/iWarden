import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:iWarden/configs/configs.dart';
import 'package:iWarden/models/location.dart';
import 'package:http/http.dart' as http;

final serviceURL = dotenv.get(
  'SERVICE_URL',
  fallback: 'http://192.168.1.200:7003',
);

class LocationController {
  static List<LocationWithZones> parseLocation(String responseBody) {
    var list = jsonDecode(responseBody) as List<dynamic>;
    List<LocationWithZones> locations =
        list.map((model) => LocationWithZones.fromJson(model)).toList();
    return locations;
  }

  Future<List<LocationWithZones>> getAll() async {
    try {
      final response = await http.get(
        Uri.parse('$serviceURL/location/location-of-the-day-by-warden/2'),
        headers: Headers.headers,
      );
      return compute(parseLocation, response.body);
    } catch (error) {
      rethrow;
    }
  }
}
