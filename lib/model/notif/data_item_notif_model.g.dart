part of 'data_item_notif_model.dart';
DataItemNotifModel _$fromJson(Map<String, dynamic> json) {
  return DataItemNotifModel()
    ..id = json['id'] ?? -1
    ..code = json['code'] ?? ''
    ..user_id = json['user_id'] ?? -1
    ..customer_id = json['customer_id'] ?? -1
    ..location_id = json['location_id'] ?? ''
    ..pic_id = json['pic_id'] ?? -1
    ..pemasangan = json['pemasangan'] ?? ''
    ..message = json['message'] ?? ''
    ..status_code = json['status_code'] ?? -1
    ..service_category_id = json['service_category_id'] ?? -1
  ;
}

Map<String, dynamic> _$toJson(DataItemNotifModel instance) =>
    <String, dynamic> {
      'id': instance.id,
      'code': instance.code,
      'user_id': instance.user_id,
      'customer_id': instance.customer_id,
      'location_id': instance.location_id,
      'pic_id': instance.pic_id,
      'pemasangan': instance.pemasangan,
      'message': instance.message,
      'status_code': instance.status_code,
      'service_category_id': instance.service_category_id,
    };