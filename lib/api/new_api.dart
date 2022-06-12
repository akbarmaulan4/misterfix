
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:misterfix/model/unit/address/address_model.dart';
import 'package:misterfix/model/unit/category/category_model.dart';
import 'package:misterfix/utils/local_data.dart';
import 'package:misterfix/model/unit/field/item_field_model.dart';
import 'package:misterfix/model/unit/pic/model_pic.dart';

class NewAPI{
  static String BASE_URL = 'https://misterfix.seje.digital/api';
  static basePost(
      String module,
      Map<String, dynamic> post,
      Map<String, String> headers,
      bool encode,
      void callback(dynamic, Exception)) async {

    print("URL ${BASE_URL + module}");
    print("POST Header ${json.encode(headers)}");
    print("POST VALUE ${json.encode(post)}");
    var mapError = new   Map();
    try{
      final response = await http.post(Uri.parse(BASE_URL + module),
          // ignore: missing_return
          headers: headers, body: encode ? json.encode(post) : post).timeout(Duration(seconds: 30));
      if(response != null){
        int responseCode = response.statusCode;
        var mapJson = json.decode(response.body);
        var dsasd = json.encode(mapJson);
        print("POST RESULT ${json.encode(mapJson)}");
        if (responseCode == 200) {
          callback(mapJson, null);
        } else if (responseCode == 401 ||
            responseCode == 403 ||
            responseCode == 401 ||
            responseCode == 403) {
          callback(null, mapJson);
        } else {
          callback(null, mapJson);
        }
      }else{
        mapError.putIfAbsent('message', () => 'Koneksi sedang tidak stabil');
        callback(null, mapError);
      }
    } on SocketException catch(e){
      mapError.putIfAbsent('message', () => 'Koneksi sedang tidak stabil');
      callback(null, mapError);
    } catch (e){
      mapError.putIfAbsent('message', () => 'Koneksi sedang tidak stabil');
      callback(null, mapError);
    }
  }

  static basePost2(
      String url,
      Map<String, dynamic> post,
      Map<String, String> headers,
      bool encode,
      void callback(dynamic, Exception)) async {

    print("URL ${url}");
    print("POST Header ${json.encode(headers)}");
    print("POST VALUE ${json.encode(post)}");

    var mapError = new Map();
    try{

      final response = await http.post( Uri.parse(url),
          // ignore: missing_return
          headers: headers, body: encode ? json.encode(post) : post).timeout(Duration(seconds: 30));
      if(response != null){
        int responseCode = response.statusCode;
        var mapJson = json.decode(response.body);
        print("POST RESULT ${json.encode(mapJson)}");
        if (mapJson['code'] == 200) {
          callback(mapJson, null);
        } else if (responseCode == 401 ||
            responseCode == 403 ||
            mapJson['code'] == 401 ||
            mapJson['code'] == 403) {
          callback(null, mapJson);
        } else {
          callback(null, mapJson);
        }
      }else{
        mapError.putIfAbsent('message', () => 'Koneksi sedang tidak stabil');
        callback(null, mapError);
      }
    } on SocketException catch(e){
      mapError.putIfAbsent('message', () => 'Koneksi sedang tidak stabil');
      callback(null, mapError);
    } catch (e){
      mapError.putIfAbsent('message', () => 'Koneksi sedang tidak stabil');
      callback(null, mapError);
    }
  }

  // static basePostMultipart( String module,
  //     Map<String, dynamic> post,
  //     Map<String, String> headers,
  //     Map<String, String> files,
  //     bool encode,
  //     void callback(dynamic, Exception)) async {
  //
  //   print("URL ${BASE_URL + module}");
  //   print("POST Header ${json.encode(headers)}");
  //   print("POST VALUE ${json.encode(post)}");
  //
  //
  //   var request = http.MultipartRequest('POST', Uri.parse(BASE_URL + module));
  //   for(int i=0; i<headers.length; i++){
  //     request.headers.addAll(headers);
  //   }
  //   for(int i=0; i<post.length; i++){
  //     request.fields.addAll(post[i]);
  //   }
  //   for(int i=0; i<files.length; i++){
  //     request.files.add(files[i]);
  //   }
  //
  // }

  static postLogin(String username, String pas, void callback(Map, Exception)) async {
    var header = new Map<String, String>();
    var post = new Map<String, dynamic>();
    header['Content-Type'] = 'application/json';
    post['email'] = username;
    post['password'] = pas;
    basePost('/login', post, header, true, (result, error){
      callback(result, error);
    });
  }

  static postRegister(String name, String email, String phone, String pass, void callback(Map, Exception)) async {
    var header = new Map<String, String>();
    var post = new Map<String, dynamic>();
    header['Content-Type'] = 'application/json';
    post['name'] = name;
    post['email'] = email;
    post['telpon'] = phone;
    post['password'] = pass;
    basePost('/register', post, header, true, (result, error){
      callback(result, error);
    });
  }

  static postChangePassword(String old_password, String password, void callback(Map, Exception)) async {
    var header = new Map<String, String>();
    var post = new Map<String, dynamic>();
    String token = await LocalData.getToken();
    header['Content-Type'] = 'application/json';
    header['Authorization'] = 'Bearer $token';
    post['old_password'] = old_password;
    post['password'] = password;
    basePost('/change_password', post, header, true, (result, error){
      callback(result, error);
    });
  }

  static postCreatePersonalUser(String category, String name, String telpon, void callback(Map, Exception)) async {
    var header = new Map<String, String>();
    var post = new Map<String, dynamic>();
    String token = await LocalData.getToken();
    header['Content-Type'] = 'application/json';
    header['Authorization'] = 'Bearer $token';
    post['category'] = category;
    post['name'] = name;
    post['telpon'] = telpon;
    basePost('/unit/createCustomer', post, header, true, (result, error){
      callback(result, error);
    });
  }

  static postCreatePersonalLocation(String custid, String address, void callback(Map, Exception)) async {
    var header = new Map<String, String>();
    var post = new Map<String, dynamic>();
    String token = await LocalData.getToken();
    header['Content-Type'] = 'application/json';
    header['Authorization'] = 'Bearer $token';
    post['customer_id'] = custid;
    post['name'] = address;
    post['address'] = address;
    basePost('/unit/createLocation', post, header, true, (result, error){
      callback(result, error);
    });
  }

  static postCreateCorporateUser(String category, String name, void callback(Map, Exception)) async {
    var header = new Map<String, String>();
    var post = new Map<String, dynamic>();
    String token = await LocalData.getToken();
    header['Content-Type'] = 'application/json';
    header['Authorization'] = 'Bearer $token';
    post['category'] = category;
    post['name'] = name;
    basePost('/unit/createCustomer', post, header, true, (result, error){
      callback(result, error);
    });
  }

  static postCreateCorporateLocation(
      String custid,
      String name,
      String address,
      String lat,
      String lng,
      void callback(Map, Exception)) async {
    var header = new Map<String, String>();
    var post = new Map<String, dynamic>();
    String token = await LocalData.getToken();
    header['Content-Type'] = 'application/json';
    header['Authorization'] = 'Bearer $token';
    post['customer_id'] = custid;
    post['name'] = name;
    post['address'] = address;
    post['lat'] = lat;
    post['lng'] = lng;
    basePost('/unit/createLocation', post, header, true, (result, error){
      callback(result, error);
    });
  }

  static postCreatePIC(String location_id, String name, String telpon, void callback(Map, Exception)) async {
    var header = new Map<String, String>();
    var post = new Map<String, dynamic>();
    String token = await LocalData.getToken();
    header['Content-Type'] = 'application/json';
    header['Authorization'] = 'Bearer $token';
    post['location_id'] = location_id;
    post['name'] = name;
    post['telpon'] = telpon;
    basePost('/unit/createPic', post, header, true, (result, error){
      callback(result, error);
    });
  }

  static postForgetPasswordEmail(String email, void callback(Map, Exception)) async {
    var header = new Map<String, String>();
    var post = new Map<String, dynamic>();
    String token = await LocalData.getToken();
    header['Content-Type'] = 'application/json';
    header['Authorization'] = 'Bearer $token';
    post['email'] = email;
    basePost('/forget/send-email', post, header, true, (result, error){
      callback(result, error);
    });
  }

  static getQRCodeScan(String code, void callback(Map, Exception)) async {
    var header = new Map<String, String>();
    var post = new Map<String, dynamic>();
    String token = await LocalData.getToken();
    header['Content-Type'] = 'application/json';
    header['Authorization'] = 'Bearer $token';
    post['code'] = code;
    basePost('/unit/get-unit-by-qr-code', post, header, true, (result, error){
      callback(result, error);
    });
  }

  static postCreateUnit(
    String code,
    String customer_id,
    AddressModel location,
    CategoryModel category,
    String tanggal_pemasangan,
    String message,
    List<ItemFieldModel> fields,
      void callback(Map, Exception)) async {
    var header = new Map<String, String>();
    var post = new Map<String, dynamic>();
    String token = await LocalData.getToken();

    // List dataField = [];
    // for(ItemFieldModel data in fields){
    //   dataField.add({'id': data.id, 'value':data.value});
    // }

    header['Content-Type'] = 'application/json';
    header['Authorization'] = 'Bearer $token';
    post['code'] = code;
    post['customer_id'] = customer_id;
    post['location_id'] = location.id;
    // post['lat'] = location.lat;
    // post['lng'] = location.lng;
    // post['address'] = location.address;
    post['service_category_id'] = category.id;
    post['tanggal_pemasangan'] = tanggal_pemasangan;
    post['message'] = message;
    post['field_value'] = fields;
    basePost('/unit/createUnit', post, header, true, (result, error){
      callback(result, error);
    });
  }

  static postCreateUnitCorp(
      String code,
      String customer_id,
      AddressModel location,
      CategoryModel category,
      ModelPIC pic,
      String tanggal_pemasangan,
      String message,
      List<ItemFieldModel> fields,
      void callback(Map, Exception)) async {
    var header = new Map<String, String>();
    var post = new Map<String, dynamic>();
    String token = await LocalData.getToken();

    // List dataField = [];
    // for(ItemFieldModel data in fields){
    //   dataField.add({'id': data.id, 'value':data.value});
    // }

    header['Content-Type'] = 'application/json';
    header['Authorization'] = 'Bearer $token';
    post['code'] = code;
    post['customer_id'] = customer_id;
    post['location_id'] = location.id;
    post['pic_id'] = pic.id;
    // post['lat'] = location.lat;
    // post['lng'] = location.lng;
    // post['address'] = location.address;
    post['service_category_id'] = category.id;
    post['tanggal_pemasangan'] = tanggal_pemasangan;
    post['message'] = message;
    post['field_value'] = fields;
    basePost('/unit/createUnit', post, header, true, (result, error){
      callback(result, error);
    });
  }

  static updateProfile( String module,
      Map<String, dynamic> post,
      String files,
      void callback(dynamic, Exception)) async {

    String token = await LocalData.getToken();
    String bar = "Bearer ${token}";
    var headers = {"Authorization": bar};

    print("URL ${BASE_URL + module}");
    print("POST Header ${json.encode(headers)}");
    print("POST VALUE ${json.encode(post)}");


    var request = http.MultipartRequest('POST', Uri.parse(BASE_URL + module));
    request.headers.addAll(headers);
    // request.fields.addAll({'expertize':keahlian});

    post.forEach((dynamicKey, list) {
      String key = dynamicKey.toString();
      String val = list.toString();
      request.fields.addAll({key:val});
    });
    if(files != ''){
      request.files.add(await http.MultipartFile.fromPath(
          'avatar', files));
    }

    // http.StreamedResponse response = await request.send();
    var streamedResponse = await request.send();
    if(streamedResponse.statusCode == 200){
      final respStr = await streamedResponse.stream.bytesToString();
      print("POST RESULT ${respStr}");
      callback(respStr, null);
    }else{
      final error = await streamedResponse.stream.bytesToString();
      callback(null, error);
    }

  }

  static baseGet(String module, Map<String, String> headers,
      void callback(dynamic, exception)) async {
    print("URL ${BASE_URL + module}");

    var mapError = new Map();
    try {
      // ignore: missing_return
      final response = await http.get(Uri.parse(BASE_URL + module), headers: headers ).timeout(Duration(seconds: 30));
      int responseCode = response.statusCode;
      var mapJson = json.decode(response.body);
      var dsa = jsonEncode(mapJson);
      print("RESPONSE ${jsonEncode(mapJson)}");

      if (responseCode== 200) {
        callback(mapJson, null);
      } else if (responseCode == 401 ||
          responseCode == 403 ||
          responseCode == 401 ||
          responseCode == 403 || responseCode == 422) {
        callback(null, mapJson);
      } else {
        mapError.putIfAbsent('message', () => 'Koneksi sedang tidak stabil');
        callback(null, mapError);
      }
    } catch (e) {
      mapError.putIfAbsent('message', () => 'Koneksi sedang tidak stabil');
      callback(null, mapError);
    }
  }

  static getProfile(void callback(Map, Exception)) async{
    var header = new Map<String, String>();
    String token = await LocalData.getToken();
    header['Content-Type'] = 'application/json';
    header['Authorization'] = 'Bearer $token';
    baseGet('/profile', header, (result, error) {
      callback(result, error);
    });
  }

  static getCategoryService(void callback(Map, Exception)) async{
    var header = new Map<String, String>();
    String token = await LocalData.getToken();
    header['Content-Type'] = 'application/json';
    header['Authorization'] = 'Bearer $token';
    baseGet('/unit/getService', header, (result, error) {
      callback(result, error);
    });
  }

  static getPersonalUser(void callback(Map, Exception)) async {
    var header = new Map<String, String>();
    String token = await LocalData.getToken();
    header['Content-Type'] = 'application/json';
    header['Authorization'] = 'Bearer $token';
    baseGet('/unit/getCustomer/personal', header, (result, error) {
      callback(result, error);
    });
  }

  static getCorporateUser(void callback(Map, Exception)) async {
    var header = new Map<String, String>();
    String token = await LocalData.getToken();
    header['Content-Type'] = 'application/json';
    header['Authorization'] = 'Bearer $token';
    baseGet('/unit/getCustomer/corporate', header, (result, error) {
      callback(result, error);
    });
  }

  static getLocationByCustomer(int id, void callback(Map, Exception)) async {
    var header = new Map<String, String>();
    String token = await LocalData.getToken();
    header['Content-Type'] = 'application/json';
    header['Authorization'] = 'Bearer $token';
    baseGet('/unit/getLocation?customer_id=${id}', header, (result, error) {
      callback(result, error);
    });
  }

  static getPICCorp(int id, void callback(Map, Exception)) async {
    var header = new Map<String, String>();
    String token = await LocalData.getToken();
    header['Content-Type'] = 'application/json';
    header['Authorization'] = 'Bearer $token';
    baseGet('/unit/getPic?location_id=${id}', header, (result, error) {
      callback(result, error);
    });
  }

  static getFieldService(String serviceID, void callback(Map, Exception)) async {
    var header = new Map<String, String>();
    String token = await LocalData.getToken();
    header['Content-Type'] = 'application/json';
    header['Authorization'] = 'Bearer $token';
    baseGet('/unit/getField?service_category_id=${serviceID}', header, (result, error) {
      callback(result, error);
    });
  }

  static getNotifikasi(void callback(Map, Exception)) async {
    var header = new Map<String, String>();
    String token = await LocalData.getToken();
    header['Content-Type'] = 'application/json';
    header['Authorization'] = 'Bearer $token';
    baseGet('/my-notif', header, (result, error) {
      callback(result, error);
    });
  }
}