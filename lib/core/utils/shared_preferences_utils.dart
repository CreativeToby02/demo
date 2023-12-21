import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  static Future<String?> saveUsername(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<String?> saveEmail(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  // static Future<String?> getString(String key) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getString(key);
  // }

  // static Future<bool?> getBool(String key) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getBool(key);
  // }
}
