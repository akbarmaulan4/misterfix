part of 'model_unit.dart';
ModelUnit _$fromJson(Map<String, dynamic> json) {
  return ModelUnit()
    ..id = json['id'] ?? -1
    ..code = json['code'] ?? ''
    ..user_id = json['user_id'] ?? -1
    ..customer_id = json['customer_id'] ?? ''
    ..location_id = json['location_id'] ?? -1
    ..pemasangan = json['pemasangan'] ?? ''
    ..message = json['message'] ?? ''
    ..service_category_id = json['service_category_id'] ?? -1
  ;
}

Map<String, dynamic> _$toJson(ModelUnit instance) =>
    <String, dynamic> {
      'id': instance.id,
      'code': instance.code,
      'user_id': instance.user_id,
      'customer_id': instance.customer_id,
      'location_id': instance.location_id,
      'pemasangan': instance.pemasangan,
      'message': instance.message,
      'service_category_id': instance.service_category_id,
    };