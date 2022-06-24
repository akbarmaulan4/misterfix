import 'package:shared_preferences/shared_preferences.dart';

class ConfigSharedPreference {
  Future<Map<String, dynamic>> getAllPrefs_mobile() async {
    Map<String, dynamic> map_ = new Map();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    for (String key in prefs.getKeys()) {
      map_[key] = prefs.get(key);
    }
    return map_;
  }

  Future<void> remove_prefAll() async {
    final SharedPreferences prefs_end = await SharedPreferences.getInstance();
    prefs_end.clear();
  }

  Future<dynamic> getPrefDinamis(String key) async {
    try {
      var map = await getAllPrefs_mobile();
      return map[key];
    } catch (e) {
      return 0;
    }
  }

  Future<int> setPref(String key, var value, int mode) async {
    /*
      mode 0 - int
      mode 1 - String
      mode 2 - boolean
     */
    try {
      final SharedPreferences prefs_and = await SharedPreferences.getInstance();
      if (mode == 0) {
        prefs_and.setInt(key, value);
      } else if (mode == 1) {
        prefs_and.setString(key, value);
      } else {
        prefs_and.setBool(key, value);
      }
      return 1;
    } catch (e) {
      print(e);
      return 0;
    }
  }
}
