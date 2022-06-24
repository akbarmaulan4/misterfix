import 'dart:convert';

import 'package:get/get.dart';
import 'package:misterfix/api/api_order.dart';

class OrderController extends GetxController {
  bool proses_selesai = false;
  RxInt posTab = 0.obs;
  RxBool checkAllItem = false.obs;
  List? data_history;
  Map? data_user;

  changePosTab(int val) {
    posTab.value = val;
  }

  void GetHistory({int? pos}) {
    print('pos');
    print(pos);
    proses_selesai = false;
    ApiOrder().getOrderHistory().then((value) async {
      String data_profil = await ApiOrder().getProfil();
      Map data_profile = jsonDecode(data_profil);
      data_user = data_profile['data'];
      try {
        Map data = jsonDecode(value);
        data_history = List.of(data['data']);
        List data_income = data['data'];
        int jumlah = data_income.length;
        if (pos == 0) {
          for (int i = 0; i < jumlah; i++) {
            if (data_income[i]['booking']['status'].toString().toLowerCase() !=
                'incoming') {
              data_history?.removeAt(i);
            }
          }
        } else if (pos == 1) {
          for (int i = 0; i < jumlah; i++) {
            print(data_income[i]['booking']['status'].toString());
            if (data_income[i]['booking']['status'].toString().toLowerCase() !=
                'doing') {
              data_history?.removeAt(i);
            }
          }
        } else if (pos == 2) {
          print(jumlah);
          for (int i = 0; i < jumlah; i++) {
            if (data_income[i]['booking']['status'].toString().toLowerCase() !=
                'done') {
              print(i);
              data_history?.removeAt(i);
            }
          }
        } else if (pos == 3) {
          for (int i = 0; i < jumlah; i++) {
            if (data_income[i]['booking']['status'].toString().toLowerCase() !=
                'canceled') {
              data_history?.removeAt(i);
            }
          }
        } else {
          data_history = data['data'];
        }
        print(data_history);
      } catch (e) {
        print(e);
        data_history = List.empty();
      }
      proses_selesai = true;
      update();
    });
  }
}
