import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:iWarden/configs/configs.dart';
import 'package:iWarden/models/pagination.dart';
import 'package:iWarden/models/vehicle_information.dart';

final serviceURL = dotenv.get(
  'SERVICE_URL',
  fallback: 'http://192.168.1.200:7003',
);

class VehicleInfoController {
  Future<Pagination> getVehicleInfoList(
      {required int vehicleInfoType, int? page, int? pageSize}) async {
    final bodyRequest = jsonEncode({
      "filter": {
        "type": vehicleInfoType,
        "CarLeft": false,
      },
      "page": page,
      "pageSize": pageSize,
      "sorts": ["-ExpiredAt"],
    });
    try {
      final response = await http.post(
        Uri.parse('$serviceURL/vehicleInformation/filter'),
        body: bodyRequest,
        headers: Headers.headers,
      );
      final responseData = jsonDecode(response.body);
      Pagination vehicleInfoPagination = Pagination.fromJson(responseData);
      return vehicleInfoPagination;
    } catch (error) {
      rethrow;
    }
  }

  Future<VehicleInformation> upsertVehicleInfo(
      VehicleInformation vehicleInfo) async {
    try {
      final response = await http.post(
        Uri.parse('$serviceURL/vehicleInformation'),
        body: jsonEncode(vehicleInfo.toJson()),
        headers: Headers.headers,
      );
      final responseData = jsonDecode(response.body);
      final vehicleFromJson = VehicleInformation.fromJson(responseData);
      return vehicleFromJson;
    } catch (error) {
      rethrow;
    }
  }

  Future<VehicleInformation> getVehicleInfoDetail(int vehicleId) async {
    try {
      final response = await http.get(
        Uri.parse('$serviceURL/$vehicleId'),
        headers: Headers.headers,
      );
      final responseData = jsonDecode(response.body);
      print(responseData);
      final vehicleFromJson = VehicleInformation.fromJson(responseData);
      return vehicleFromJson;
    } catch (error) {
      rethrow;
    }
  }
}
