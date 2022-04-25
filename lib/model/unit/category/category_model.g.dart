part of 'category_model.dart';
CategoryModel _$fromJson(Map<String, dynamic> json) {
  return CategoryModel()
    ..id = json['id'] ?? -1
    ..name = json['name'] ?? ''
    ..image = json['image'] ?? ''
    ..status = json['status'] ?? -1
    ..slug = json['slug'] ?? ''
  ;
}

Map<String, dynamic> _$toJson(CategoryModel instance) =>
    <String, dynamic> {
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'status': instance.status,
      'slug': instance.slug,
    };