import 'dart:developer';
import 'dart:io';
import 'package:aad_oauth/aad_oauth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:iWarden/configs/configs.dart';
import 'package:iWarden/helpers/shared_preferences_helper.dart';
import 'dart:convert';

final serviceURL = dotenv.get(
  'SERVICE_URL',
  fallback: 'http://192.168.1.200:7003',
);

class UserController {
  Future<dynamic> getMe(String jwt) async {
    final response = await http.get(
      Uri.parse('$serviceURL/warden/get-me'),
      headers: {
        "Authorization": "Bearer $jwt",
        'Content-Type': 'application/json',
      },
    );
    final responseData = jsonDecode(response.body);
    return responseData;
  }
}
