import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:iWarden/configs/configs.dart';
import 'package:iWarden/helpers/dio_helper.dart';
import 'package:iWarden/models/abort_pcn.dart';
import 'package:flutter/foundation.dart';

class AbortController {
  final dio = DioHelper.defaultApiClient;

  Future<List<CancellationReason>> getCancellationReasonList() async {
    try {
      final response = await dio.get(
        '/contravention/list-cancellation-reason',
      );
      List<dynamic> temp = response.data;
      List<CancellationReason> locations =
          temp.map((model) => CancellationReason.fromJson(model)).toList();
      return locations;
    } catch (error) {
      rethrow;
    }
  }

  Future<void> abortPCN(AbortPCN abortPcn) async {
    try {
      await dio.post(
        '/contravention/abort-pcn',
        data: abortPcn.toJson(),
      );
    } catch (error) {
      rethrow;
    }
  }
}

final abortController = AbortController();
