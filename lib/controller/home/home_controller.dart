
import 'package:get/get.dart';
import 'package:misterfix/api/new_api.dart';
import 'package:misterfix/model/notif/item_notif_model.dart';
import 'package:misterfix/model/order/order_item_model.dart';

class HomeController extends GetxController{

  RxList<OrderItemModel> dataHistory = <OrderItemModel>[].obs;

  getHistoryUnitHome() {
    NewAPI.getHistoryOrder((result, error) {
      if (error != null) {

      }
      if (result != null) {
        var unread = (result['data'] as List).map((e) => e == null ? null : OrderItemModel.fromJson(e as Map<String, dynamic>)).toList();
        dataHistory.value = unread as List<OrderItemModel>;
      }
    });
  }
}