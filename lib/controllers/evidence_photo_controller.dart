import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:iWarden/configs/configs.dart';
import 'package:http_parser/http_parser.dart';
import 'package:iWarden/helpers/dio_helper.dart';

final serviceURL = dotenv.get(
  'SERVICE_URL',
  fallback: 'http://192.168.1.200:7003',
);

class EvidencePhotoController {
  final dio = DioHelper.defaultApiClient;
  Future<dynamic> uploadImage(File image) async {
    String fileName = image.path;
    var formData = FormData.fromMap({
      'photo': await MultipartFile.fromFile(
        fileName,
        contentType: MediaType('image', 'jpeg'),
      ),
    });
    var response = await dio.post('/evidencePhoto/upload', data: formData);
    return response.data;
  }
}

final evidencePhotoController = EvidencePhotoController();
