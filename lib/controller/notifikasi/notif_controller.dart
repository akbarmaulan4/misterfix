
import 'package:get/get.dart';
import 'package:misterfix/api/new_api.dart';
import 'package:misterfix/model/notif/item_notif_model.dart';

class NotifController extends GetxController{

  RxList<ItemNotifModel> dataUnred = <ItemNotifModel>[].obs;

  getNotif() {
    NewAPI.getNotifikasi((result, error) {
      if (error != null) {

      }
      if (result != null) {
        var data = result['data'];
        var unread = (data['unread'] as List).map((e) => e == null ? null : ItemNotifModel.fromJson(e as Map<String, dynamic>)).toList();
        dataUnred.value = unread as List<ItemNotifModel>;
      }
    });
  }
}