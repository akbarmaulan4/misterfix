part of 'field_model.dart';
FieldModel _$fromJson(Map<String, dynamic> json) {
  return FieldModel()
    ..id = json['id'] ?? -1
    ..service_category_id = json['service_category_id'] ?? -1
    ..name = json['name'] ?? ''
    ..category = json['category'] ?? ''
    ..values = json['values'] != null ? (json['values'] as List).map((e) => e == null ? null : ItemFieldModel.fromJson(e as Map<String, dynamic>)).toList() : []
  ;
}

Map<String, dynamic> _$toJson(FieldModel instance) =>
    <String, dynamic> {
      'id': instance.id,
      'service_category_id': instance.service_category_id,
      'name': instance.name,
      'category': instance.category,
      'values': instance.values,
    };