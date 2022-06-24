import 'package:misterfix/utils/local_data.dart';

class HeaderApi {
  Map<String, String> requestHeaders = {
    'Accept': 'application/json',
  };
  Future<Map<String, String>> CustomHeader() async {
    try {
      Map<String, String> header = Map();
      String token = await LocalData.getToken();
      header['Content-Type'] = 'application/json';
      header['Authorization'] = 'Bearer $token';
      return header;
    } catch (e) {
      return requestHeaders;
    }
  }
}
