part of 'model_item_keahlian.dart';

ModelItemKeahlian _$fromJson(Map<String, dynamic> json) {
  return ModelItemKeahlian()
    ..id = json['id'] ?? -1
    ..name = json['name'] ?? ''
    ..status = json['status'] ?? -1
    ..slug = json['slug'] ?? ''
    ..pivot = json['pivot'] != null ?  ModelPivotKeahlian.fromJson(json['pivot']):ModelPivotKeahlian()
  ;
}

Map<String, dynamic> _$toJson(ModelItemKeahlian instance) =>
    <String, dynamic> {
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'slug': instance.slug,
      'pivot': instance.pivot,
    };