part of 'address_model.dart';
AddressModel _$fromJson(Map<String, dynamic> json) {
  return AddressModel()
    ..id = json['id'] ?? -1
    ..name = json['name'] ?? ''
    ..customer_id = json['customer_id'] ?? ''
    ..address = json['address'] ?? ''
    ..phone_number = json['phone_number'] ?? ''
    ..lat = json['lat'] ?? ''
    ..lng = json['lng'] ?? ''
  ;
}

Map<String, dynamic> _$toJson(AddressModel instance) =>
    <String, dynamic> {
      'id': instance.id,
      'name': instance.name,
      'customer_id': instance.customer_id,
      'address': instance.address,
      'phone_number': instance.phone_number,
      'lat': instance.lat,
      'lng': instance.lng,
    };