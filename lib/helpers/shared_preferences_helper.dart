import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static void setStringValue(String key, String? value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value!);
  }

  static Future<String?> getStringValue(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final String? value = prefs.getString(key);
    return value;
  }

  static void removeStringValue(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
