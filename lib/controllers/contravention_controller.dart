import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:iWarden/configs/configs.dart';
import 'package:iWarden/models/ContraventionService.dart';
import 'package:http/http.dart' as http;
import 'package:iWarden/models/pagination.dart';

final serviceURL = dotenv.get(
  'SERVICE_URL',
  fallback: 'http://192.168.1.200:7003',
);

class ContraventionController {
  Future<void> createPCN(ContraventionCreateWardenCommand pcn) async {
    try {
      final response = await http.post(
        Uri.parse('$serviceURL/contravention/create-pcn'),
        body: jsonEncode(pcn.toJson()),
        headers: Headers.headers,
      );
      // final responseData = jsonDecode(response.body);
      print(response.body);
    } catch (error) {
      rethrow;
    }
  }

  Future<Pagination> getContraventionServiceList(
      {int? page, int? pageSize}) async {
    final bodyRequest = jsonEncode({
      "page": page,
      "pageSize": pageSize,
      "sorts": ["-Created"],
    });
    try {
      final response = await http.post(
        Uri.parse('$serviceURL/contravention/filter'),
        body: bodyRequest,
        headers: Headers.headers,
      );
      final responseData = jsonDecode(response.body);
      Pagination contraventionPagination = Pagination.fromJson(responseData);
      print(contraventionPagination.rows.length);
      return contraventionPagination;
    } catch (error) {
      rethrow;
    }
  }
}
