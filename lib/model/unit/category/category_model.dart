part 'category_model.g.dart';
class CategoryModel{
  CategoryModel(){}
  int id = -1;
  String name = '';
  String image = '';
  int status = -1;
  String slug = '';

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$fromJson(json);
  Map<String, dynamic> toJson() => _$toJson(this);

}