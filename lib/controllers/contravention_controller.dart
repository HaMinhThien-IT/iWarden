import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:iWarden/configs/configs.dart';
import 'package:iWarden/models/ContraventionService.dart';
import 'package:http/http.dart' as http;
import 'package:iWarden/models/contravention.dart';
import 'package:iWarden/models/pagination.dart';
import 'package:http_parser/http_parser.dart';

final serviceURL = dotenv.get(
  'SERVICE_URL',
  fallback: 'http://192.168.1.200:7003',
);

class ContraventionController {
  Future<Contravention> createPCN(ContraventionCreateWardenCommand pcn) async {
    try {
      final response = await http.post(
        Uri.parse('$serviceURL/contravention/create-pcn'),
        body: jsonEncode(pcn.toJson()),
        headers: Headers.headers,
      );
      final responseData = jsonDecode(response.body);
      Contravention contraventionResult = Contravention.fromJson(responseData);
      print(responseData);
      return contraventionResult;
    } catch (error) {
      rethrow;
    }
  }

  Future<Contravention> getContraventionDetail(int id) async {
    try {
      final response = await http.get(
        Uri.parse('$serviceURL/contravention/$id'),
        headers: Headers.headers,
      );
      final responseData = jsonDecode(response.body);
      Contravention contraventionResult = Contravention.fromJson(responseData);
      return contraventionResult;
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
      "filter": {
        "status": ContraventionStatus.Open.index,
      }
    });
    try {
      final response = await http.post(
        Uri.parse('$serviceURL/contravention/filter'),
        body: bodyRequest,
        headers: Headers.headers,
      );
      final responseData = jsonDecode(response.body);
      Pagination contraventionPagination = Pagination.fromJson(responseData);
      return contraventionPagination;
    } catch (error) {
      rethrow;
    }
  }

  Future<Pagination> getContraventionReasonServiceList() async {
    final bodyRequest = jsonEncode({
      "page": 1,
      "pageSize": 1000,
    });

    try {
      final response = await http.post(
        Uri.parse('$serviceURL/contravention-reason-translation/filter'),
        headers: Headers.headers,
        body: bodyRequest,
      );
      final responseData = jsonDecode(response.body);
      Pagination contraventionReasonPagination =
          Pagination.fromJson(responseData);
      return contraventionReasonPagination;
    } catch (error) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getVehicleDetailByPlate(
      {required String plate}) async {
    try {
      final response = await http.get(
        Uri.parse('$serviceURL/contravention/vehicle-details/$plate'),
        headers: Headers.headers,
      );
      final responseData = jsonDecode(response.body);
      return responseData;
    } catch (error) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> uploadContraventionImage(
      ContraventionCreatePhoto contraventionCreatePhoto) async {
    final uri = Uri.parse('$serviceURL/contravention/create-photo-pcn');
    var request = http.MultipartRequest(
      "POST",
      uri,
    );
    request.headers['Authorization'] = Headers.jwt;
    request.fields['contraventionReference'] =
        contraventionCreatePhoto.contraventionReference;
    request.fields['photoType'] = contraventionCreatePhoto.photoType.toString();
    request.fields['originalFileName'] =
        contraventionCreatePhoto.originalFileName;
    request.fields['capturedDateTime'] =
        contraventionCreatePhoto.capturedDateTime.toIso8601String();
    request.files.add(await http.MultipartFile.fromPath(
      'file',
      contraventionCreatePhoto.file!.path,
      contentType: MediaType('image', 'jpeg'),
    ));
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    return jsonDecode(respStr);
  }
}

final contraventionController = ContraventionController();
