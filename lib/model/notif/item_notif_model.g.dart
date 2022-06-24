part of 'item_notif_model.dart';
ItemNotifModel _$fromJson(Map<String, dynamic> json) {
  return ItemNotifModel()
    ..id = json['id'] ?? -1
    ..user_id = json['user_id'] ?? -1
    ..relation_id = json['relation_id'] ?? -1
    ..category = json['category'] ?? ''
    ..msg = json['msg'] ?? ''
    ..read = json['relation_id'] ?? -1
    ..created_at = json['created_at'] ?? ''
    ..updated_at = json['updated_at'] ?? ''
    ..user_name = json['user_name'] ?? ''
    ..service_category = json['service_category'] ?? ''
    ..pemasangan = json['pemasangan'] ?? ''
    ..location = json['location'] ?? ''
    ..gedung = json['gedung'] ?? ''
    ..lantau = json['lantau'] ?? ''
    ..type = json['type'] ?? ''
    ..merk = json['merk'] ?? ''
    // ..data = DataItemNotifModel.fromJson(json['data']);
  ;
}

Map<String, dynamic> _$toJson(ItemNotifModel instance) =>
    <String, dynamic> {
      'id': instance.id,
      'user_id': instance.user_id,
      'relation_id': instance.relation_id,
      'category': instance.category,
      'msg': instance.msg,
      'read': instance.read,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'user_name': instance.user_name,
      'service_category': instance.service_category,
      'pemasangan': instance.pemasangan,
      'location': instance.location,
      'gedung': instance.gedung,
      'lantau': instance.lantau,
      'type': instance.type,
      'merk': instance.merk,
      // 'data': instance.data,
    };