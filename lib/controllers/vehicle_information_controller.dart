import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:iWarden/configs/configs.dart';
import 'package:iWarden/helpers/dio_helper.dart';
import 'package:iWarden/models/pagination.dart';
import 'package:iWarden/models/vehicle_information.dart';

final serviceURL = dotenv.get(
  'SERVICE_URL',
  fallback: 'http://192.168.1.200:7003',
);

class VehicleInfoController {
  final dio = DioHelper.defaultApiClient;
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
      final response =
          await dio.post('/vehicleInformation/filter', data: bodyRequest);
      Pagination vehicleInfoPagination = Pagination.fromJson(response.data);
      return vehicleInfoPagination;
    } catch (error) {
      rethrow;
    }
  }

  Future<VehicleInformation> upsertVehicleInfo(
      VehicleInformation vehicleInfo) async {
    try {
      final response = await dio.post(
        '/vehicleInformation',
        data: vehicleInfo.toJson(),
      );
      final vehicleFromJson = VehicleInformation.fromJson(response.data);
      return vehicleFromJson;
    } catch (error) {
      rethrow;
    }
  }

  Future<VehicleInformation> getVehicleInfoDetail(int vehicleId) async {
    try {
      final response = await dio.get(
        vehicleId.toString(),
      );
      final vehicleFromJson = VehicleInformation.fromJson(response.data);
      return vehicleFromJson;
    } catch (error) {
      rethrow;
    }
  }
}
