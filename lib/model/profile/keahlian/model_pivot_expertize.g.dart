part of 'model_pivot_expertize.dart';
ModelPivotKeahlian _$fromJson(Map<String, dynamic> json) {
  return ModelPivotKeahlian()
    ..user_id = json['user_id'] ?? -1
    ..service_category_id = json['service_category_id'] ?? -1
  ;
}

Map<String, dynamic> _$toJson(ModelPivotKeahlian instance) =>
    <String, dynamic> {
      'user_id': instance.user_id,
      'service_category_id': instance.service_category_id,
    };