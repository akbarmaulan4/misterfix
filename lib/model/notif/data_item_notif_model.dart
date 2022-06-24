part 'data_item_notif_model.g.dart';
class DataItemNotifModel{
  DataItemNotifModel(){}
  int id = -1;
  String code = '';
  int user_id = -1;
  int customer_id = -1;
  int location_id = -1;
  int pic_id = -1;
  String pemasangan = '';
  String message = '';
  int status_code = -1;
  int service_category_id = -1;

  factory DataItemNotifModel.fromJson(Map<String, dynamic> json) => _$fromJson(json);
  Map<String, dynamic> toJson() => _$toJson(this);

}