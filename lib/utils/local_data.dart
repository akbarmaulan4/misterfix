
import 'dart:convert';

import 'package:misterfix/model/auth/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData{

  static Future<bool> removeAllPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  static Future<bool> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('token');
  }

  static void saveToken(String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', val);
  }

  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('token');
    if (data != null && data.isNotEmpty) {
      return data;
    }
    return '';
  }

  static Future<bool> removeRemember() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('remember');
  }

  static void saveRemember(bool val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('remember', val);
  }

  static Future<bool> getRemember() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getBool('remember');
    if (data != null && data) {
      return data;
    }
    return false;
  }

  static Future<bool> removeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('user');
  }

  static void saveUser(UserModel val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', jsonEncode(val));
  }

  static Future<UserModel?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('user');
    if (data != null && data.isNotEmpty) {
      return UserModel.fromJson(jsonDecode(data));
    }
    return null;
  }
}