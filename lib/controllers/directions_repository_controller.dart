import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iWarden/models/directions.dart';

final googleAPIKey = dotenv.get(
  'GOOGLE_API_KEY',
  fallback: 'AIzaSyDWb27PuihbFAdxkKn2RMu7y_GKpQypeCA',
);

class DirectionsRepository {
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';
  static final dio = Dio();

  Future<Directions> getDirections(
      {required LatLng origin, required LatLng destination}) async {
    final response = await dio.get(_baseUrl, queryParameters: {
      'origin': '${origin.latitude},${origin.longitude}',
      'destination': '${destination.latitude},${destination.longitude}',
      'key': googleAPIKey,
    });
    print(response.data);
    return Directions.fromJson(response.data);
  }
}

final directionsRepository = DirectionsRepository();
