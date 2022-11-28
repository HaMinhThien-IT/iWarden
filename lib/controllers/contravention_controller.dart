import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:iWarden/configs/configs.dart';
import 'package:iWarden/helpers/dio_helper.dart';
import 'package:iWarden/models/ContraventionService.dart';
import 'package:http/http.dart' as http;
import 'package:iWarden/models/contravention.dart';
import 'package:iWarden/models/pagination.dart';
import 'package:http_parser/http_parser.dart';

class ContraventionController {
  final dio = DioHelper.defaultApiClient;
  Future<Contravention> createPCN(ContraventionCreateWardenCommand pcn) async {
    try {
      final response = await dio.post(
        '/contravention/create-pcn',
        data: pcn.toJson(),
      );
      Contravention contraventionResult = Contravention.fromJson(response.data);
      return contraventionResult;
    } catch (error) {
      rethrow;
    }
  }

  Future<Contravention> getContraventionDetail(int id) async {
    try {
      final response = await dio.get(
        '/contravention/$id',
      );
      Contravention contraventionResult = Contravention.fromJson(response.data);
      return contraventionResult;
    } catch (error) {
      rethrow;
    }
  }

  Future<Pagination> getContraventionServiceList(
      {int? page, int? pageSize}) async {
    try {
      final response = await dio.post(
        '/contravention/filter',
        data: {
          "page": page,
          "pageSize": pageSize,
          "sorts": ["-Created"],
          "filter": {
            "status": ContraventionStatus.Open.index,
          }
        },
      );
      Pagination contraventionPagination = Pagination.fromJson(response.data);
      return contraventionPagination;
    } catch (error) {
      rethrow;
    }
  }

  Future<Pagination> getContraventionReasonServiceList() async {
    try {
      final response = await dio.post(
        '/contravention-reason-translation/filter',
        data: {
          "page": 1,
          "pageSize": 1000,
        },
      );
      Pagination contraventionReasonPagination =
          Pagination.fromJson(response.data);
      return contraventionReasonPagination;
    } catch (error) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getVehicleDetailByPlate(
      {required String plate}) async {
    try {
      final response = await dio.get(
        '/contravention/vehicle-details/$plate',
      );
      return response.data;
    } catch (error) {
      rethrow;
    }
  }

  Future<dynamic> uploadContraventionImage(
      ContraventionCreatePhoto contraventionCreatePhoto) async {
    String fileName = contraventionCreatePhoto.file!.path;
    var formData = FormData.fromMap({
      'contraventionReference': contraventionCreatePhoto.contraventionReference,
      'photoType': contraventionCreatePhoto.photoType.toString(),
      'originalFileName': contraventionCreatePhoto.originalFileName,
      'capturedDateTime':
          contraventionCreatePhoto.capturedDateTime.toIso8601String(),
      'file': await MultipartFile.fromFile(
        fileName,
        contentType: MediaType('image', 'jpeg'),
      ),
    });
    var response =
        await dio.post('/contravention/create-photo-pcn', data: formData);
    return response.data;
  }
}

final contraventionController = ContraventionController();
