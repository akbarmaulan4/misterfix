
part of 'item_field_model.dart';
ItemFieldModel _$fromJson(Map<String, dynamic> json) {
  return ItemFieldModel()
    ..id = json['id'] ?? -1
    ..fields_id = json['fields_id'] ?? -1
    ..value = json['value'] ?? ''
  ;
}

Map<String, dynamic> _$toJson(ItemFieldModel instance) =>
    <String, dynamic> {
      'id': instance.id,
      'fields_id': instance.fields_id,
      'value': instance.value
    };