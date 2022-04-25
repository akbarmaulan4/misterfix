part of 'section_field_model.dart';
SectionFieldModel _$fromJson(Map<String, dynamic> json) {
  return SectionFieldModel()
    ..name = json['name'] ?? ''
    ..values = json['values'] != null ? (json['values'] as List).map((e) => e ).toList() : []
  ;
}

Map<String, dynamic> _$toJson(SectionFieldModel instance) =>
    <String, dynamic> {
      'name': instance.name,
      'values': instance.values,
    };