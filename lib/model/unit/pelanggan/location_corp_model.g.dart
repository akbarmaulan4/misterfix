part of 'location_corp_model.dart';
LocationCorpModel _$fromJson(Map<String, dynamic> json) {
  return LocationCorpModel()
    ..id = json['id'] ?? -1
    ..customer_id = json['customer_id'] ?? ''
    ..name = json['name'] ?? ''
    ..address = json['address'] ?? ''
    ..phone_number = json['phone_number'] ?? ''
    ..lat = json['lat'] ?? ''
    ..lng = json['lng'] ?? ''
  ;
}

Map<String, dynamic> _$toJson(LocationCorpModel instance) =>
    <String, dynamic> {
      'id': instance.id,
      'customer_id': instance.customer_id,
      'name': instance.name,
      'address': instance.address,
      'phone_number': instance.phone_number,
      'lat': instance.lat,
      'lng': instance.lng,
    };