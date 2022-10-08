import 'dart:convert';

import 'package:anyline_plugin/anyline_plugin.dart';
import 'package:flutter/services.dart';
import 'package:iWarden/screens/demo-ocr/result.dart';
import 'package:iWarden/screens/demo-ocr/scan_modes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

abstract class AnylineService {
  Future<Result?> scan(ScanMode mode);

  List<Result> getResultList();

  String? getSdkVersion();
}

class AnylineServiceImpl implements AnylineService {
  late AnylinePlugin anylinePlugin;
  List<Result> _results = [];
  String? _sdkVersion = 'Unknown';

  @override
  Future<Result?> scan(ScanMode mode) async {
    Result? result = await _callAnyline(mode);
    if (result == null) {
      return result;
    }
    _saveResultToResultList(result);
    return result;
  }

  @override
  List<Result> getResultList() {
    return _results;
  }

  AnylineServiceImpl() {
    _initAnylinePlugin();
    _initResultListFromSharedPreferences();
  }

  @override
  String? getSdkVersion() {
    return _sdkVersion;
  }

  _initAnylinePlugin() async {
    String? sdkVersion;
    try {
      sdkVersion = await AnylinePlugin.sdkVersion;
      anylinePlugin = AnylinePlugin();
    } on PlatformException {
      sdkVersion = 'Failed to get SDK version.';
    }
    _sdkVersion = sdkVersion;
  }

  _initResultListFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = prefs.getStringList('results') ?? [];
    List<Result> results = [
      for (String result in list) Result.fromJson(json.decode(result))
    ];
    _results = results;
  }

  Future<Result?> _callAnyline(ScanMode mode) async {
    String configJson = await _loadJsonConfigFromFile(mode.key);

    debugPrint(configJson);
    String? stringResult = await anylinePlugin.startScanning(configJson);

    if (stringResult == 'Canceled') {
      return null;
    }

    Map<String, dynamic>? jsonResult = jsonDecode(stringResult!);
    return Result(jsonResult, mode, DateTime.now());
  }

  Future<String> _loadJsonConfigFromFile(String config) async {
    return await rootBundle.loadString("config/${config}Config.json");
  }

  _saveResultToResultList(Result result) {
    _results.insert(0, result);
    _saveResultListToSharedPreferences(_results);
  }

  _saveResultListToSharedPreferences(List<Result> results) async {
    List<String> results = [
      for (Result result in _results) json.encode(result.toJson())
    ];

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('results', results);
  }
}
