import 'package:shared_preferences/shared_preferences.dart';

class CachHelper {
  static late SharedPreferences sharedPref;
  static void init() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  static Future<bool> putboolean({
    required String key,
    required bool value,
  }) async {
    return await sharedPref.setBool(key, value);
  }

  static Future<bool?> getBoolean({required String key}) async {
    return sharedPref.getBool(key);
  }
}
