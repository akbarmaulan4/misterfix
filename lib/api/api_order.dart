import 'dart:convert';

import 'package:http/http.dart';
import 'package:misterfix/api/HeaderApi.dart';
import 'package:misterfix/api/new_api.dart';
import 'package:misterfix/config/ConfigSharedPreference.dart';

class ApiOrder {
  Client client = Client();
  static const String Url_history_order = "/provider/order-history";
  static const String Url_profile = "/profile";
  static const String Url_order_service =
      "/provider/get-available-order-service";
  int status_code = 0;

  Future<String> getProfil() async {
    try {
      final response = await client
          .get(Uri.parse(NewAPI.BASE_URL + Url_profile),
              headers: await HeaderApi().CustomHeader())
          .timeout(
            Duration(seconds: 10),
          );
      status_code = response.statusCode;
      if (response.statusCode == 200) {
        String result = response.body.toString();
        Map data_profile = jsonDecode(result);
        ConfigSharedPreference()
            .setPref('profile', jsonEncode(data_profile['data']), 1);
        return result;
      } else {
        return '';
      }
    } catch (e) {
      return '';
    }
  }

  Future<String> getOrderHistory() async {
    try {
      final response = await client
          .get(Uri.parse(NewAPI.BASE_URL + Url_history_order),
              headers: await HeaderApi().CustomHeader())
          .timeout(
            Duration(seconds: 10),
          );
      status_code = response.statusCode;
      if (response.statusCode == 200) {
        String result = response.body.toString();
        return result;
      } else {
        return '';
      }
    } catch (e) {
      return '';
    }
  }

  Future<String> AvailableOrder() async {
    try {
      final response = await client
          .get(Uri.parse(NewAPI.BASE_URL + Url_order_service),
          headers: await HeaderApi().CustomHeader())
          .timeout(
        Duration(seconds: 10),
      );
      status_code = response.statusCode;
      if (response.statusCode == 200) {
        String result = response.body.toString();
        return result;
      } else {
        return '';
      }
    } catch (e) {
      return '';
    }
  }
}
