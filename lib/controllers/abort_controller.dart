import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:iWarden/configs/configs.dart';
import 'package:iWarden/models/abort_pcn.dart';
import 'package:flutter/foundation.dart';

final serviceURL = dotenv.get(
  'SERVICE_URL',
  fallback: 'http://192.168.1.200:7003',
);

class AbortController {
  static List<CancellationReason> parseCancellationReason(String responseBody) {
    var list = jsonDecode(responseBody) as List<dynamic>;
    List<CancellationReason> cancellationReasons =
        list.map((model) => CancellationReason.fromJson(model)).toList();
    return cancellationReasons;
  }

  Future<List<CancellationReason>> getCancellationReasonList() async {
    try {
      final response = await http.get(
        Uri.parse('$serviceURL/contravention/list-cancellation-reason'),
        headers: Headers.headers,
      );
      return compute(parseCancellationReason, response.body);
    } catch (error) {
      rethrow;
    }
  }

  Future<void> abortPCN(AbortPCN abortPcn) async {
    try {
      await http.post(
        Uri.parse('$serviceURL/contravention/abort-pcn'),
        body: jsonEncode(abortPcn.toJson()),
        headers: Headers.headers,
      );
    } catch (error) {
      rethrow;
    }
  }
}

final abortController = AbortController();
