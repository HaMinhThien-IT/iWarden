import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:iWarden/configs/configs.dart';
import 'package:iWarden/models/pagination.dart';
import 'package:iWarden/models/statistic.dart';
import 'package:iWarden/models/vehicle_information.dart';

final serviceURL = dotenv.get(
  'SERVICE_URL',
  fallback: 'http://192.168.1.200:7003',
);

class StatisticController {
  Future<StatisticWardenPropsData> getDataStatistic(
      StatisticWardenPropsFilter filter) async {
    final bodyRequest = jsonEncode({
      "ZoneId": filter.zoneId,
      "timeStart": filter.timeStart.toString(),
      "timeEnd": filter.timeEnd.toString(),
    });
    try {
      final response = await http.post(
        Uri.parse('$serviceURL/vehicleInformation/statistics'),
        body: bodyRequest,
        headers: Headers.headers,
      );
      final responseData = jsonDecode(response.body);
      print(response.body);
      StatisticWardenPropsData statisticData =
          StatisticWardenPropsData.fromJson(responseData);
      return statisticData;
    } catch (error) {
      rethrow;
    }
  }
}

final statisticController = StatisticController();
