part of 'model_pic.dart';
ModelPIC _$fromJson(Map<String, dynamic> json) {
  return ModelPIC()
    ..id = json['id'] ?? -1
    ..name = json['name'] ?? ''
    ..telpon = json['telpon'] ?? ''
  ;
}

Map<String, dynamic> _$toJson(ModelPIC instance) =>
    <String, dynamic> {
      'id': instance.id,
      'name': instance.name,
      'telpon': instance.telpon
    };