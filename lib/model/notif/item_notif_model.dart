import 'data_item_notif_model.dart';
part 'item_notif_model.g.dart';
class ItemNotifModel{
  ItemNotifModel(){}
  int id = -1;
  int user_id = -1;
  int relation_id = -1;
  String category = '';
  String msg = '';
  int read = -1;
  String created_at = '';
  String updated_at = '';
  String user_name = '';
  String service_category = '';
  String pemasangan = '';
  String location = '';
  String gedung = '';
  String lantau = '';
  String type = '';
  String merk = '';
  // DataItemNotifModel data = DataItemNotifModel();

  factory ItemNotifModel.fromJson(Map<String, dynamic> json) => _$fromJson(json);
  Map<String, dynamic> toJson() => _$toJson(this);

}