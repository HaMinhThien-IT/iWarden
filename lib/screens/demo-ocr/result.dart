import 'package:iWarden/screens/demo-ocr/scan_modes.dart';

class Result {
  DateTime timestamp;
  ScanMode scanMode;
  Map<String, dynamic>? jsonMap;

  Result(this.jsonMap, this.scanMode, this.timestamp);

  int get length {
    return jsonMap!.length;
  }

  get values {
    return jsonMap!.values.toList();
  }

  get keys {
    return jsonMap!.keys.toList();
  }

  Map<String, dynamic> toJson() => {
        'timestamp': timestamp.millisecondsSinceEpoch,
        'scanMode': scanMode.key,
        'jsonMap': jsonMap,
      };

  Result.fromJson(Map<String, dynamic> json)
      : timestamp = DateTime.fromMicrosecondsSinceEpoch(json['timestamp']),
        scanMode = ScanMode.values
            .firstWhere((element) => element.key == json['scanMode']),
        jsonMap = json['jsonMap'];
}
