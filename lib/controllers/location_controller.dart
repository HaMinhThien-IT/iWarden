import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:iWarden/helpers/dio_helper.dart';
import 'package:iWarden/models/location.dart';

final serviceURL = dotenv.get(
  'SERVICE_URL',
  fallback: 'http://192.168.1.200:7003',
);

class LocationController {
  final dio = DioHelper.defaultApiClient;
  Future<List<LocationWithZones>> getAll() async {
    int idWarden = 2;
    try {
      final response =
          await dio.get('/location/location-of-the-day-by-warden/$idWarden');
      print(response.data);
      List<dynamic> temp = response.data;
      List<LocationWithZones> locations =
          temp.map((model) => LocationWithZones.fromJson(model)).toList();
      return locations;
    } catch (error) {
      rethrow;
    }
  }
}
