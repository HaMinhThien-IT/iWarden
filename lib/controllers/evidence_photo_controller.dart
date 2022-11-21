import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:iWarden/configs/configs.dart';
import 'package:http_parser/http_parser.dart';

final serviceURL = dotenv.get(
  'SERVICE_URL',
  fallback: 'http://192.168.1.200:7003',
);

class EvidencePhotoController {
  Future<Map<String, dynamic>> uploadImage(File image) async {
    final uri = Uri.parse('$serviceURL/evidencePhoto/upload');
    var request = http.MultipartRequest("POST", uri);
    request.headers['Authorization'] = Headers.jwt;
    request.files.add(await http.MultipartFile.fromPath(
      'photo',
      image.path,
      contentType: MediaType('image', 'jpeg'),
    ));
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    return jsonDecode(respStr);
  }
}
