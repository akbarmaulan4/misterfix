
class CategoryServiceModel{
  CategoryServiceModel(){}
  int? id;
  String? name;
  int? status;
  String? slug;
  String? created_at;
  String? updated_at;

  factory CategoryServiceModel.fromJson(Map<String, dynamic> json) => _$fromJson(json);
  Map<String, dynamic> toJson() => _$toJson(this);
}

CategoryServiceModel _$fromJson(Map<String, dynamic> json) {
  return CategoryServiceModel()
    ..id = json['id'] ?? -1
    ..name = json['name'] ?? ''
    ..status = json['status'] ?? -1
    ..slug = json['slug'] ?? ''
    ..created_at = json['updated_at'] ?? ''
    ..updated_at = json['updated_at'] ?? ''
  ;
}

Map<String, dynamic> _$toJson(CategoryServiceModel instance) =>
    <String, dynamic> {
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'slug': instance.slug,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };