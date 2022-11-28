import 'dart:developer';
import 'dart:io';

import 'package:aad_oauth/aad_oauth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:iWarden/configs/configs.dart';
import 'package:iWarden/controllers/user_controller.dart';
import 'package:iWarden/helpers/shared_preferences_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceURL = dotenv.get(
  'SERVICE_URL',
  fallback: 'http://192.168.1.200:7003',
);

class Auth with ChangeNotifier {
  String? _token;
  String? _userId;

  String? get token {
    return _token;
  }

  bool get isAuth {
    return token != null;
  }

  void loginWithMicrosoft() async {
    final AadOAuth oauth = AadOAuth(OAuthConfig.config);
    await oauth.login();
    final accessToken = await oauth.getIdToken();
    SharedPreferencesHelper.setStringValue(
        PreferencesKeys.accessToken, accessToken);
    loginWithJwt(accessToken ?? '');
  }

  void loginWithJwt(String jwt) async {
    print('Logged in successfully, your access token: Bearer $jwt');
    final prefs = await SharedPreferences.getInstance();
    try {
      final userController = UserController();
      final responseData = await userController.getMe();
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = jwt;
      _userId = responseData['Id'].toString();
      notifyListeners();
      final userData = json.encode({
        'token': _token,
        'userId': _userId,
      });
      prefs.setString('userData', userData);
    } catch (error) {
      print(error);
      rethrow;
    }
  }

  void logout() async {
    final AadOAuth oauth = AadOAuth(OAuthConfig.config);
    await oauth.logout();
    final prefs = await SharedPreferences.getInstance();
    SharedPreferencesHelper.removeStringValue(PreferencesKeys.accessToken);
    prefs.clear();
    print('Logout successfully!');
  }
}
