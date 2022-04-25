part 'model_pic.g.dart';
class ModelPIC{
  ModelPIC(){}
  int id = -1;
  String name = '';
  String telpon = '';

  factory ModelPIC.fromJson(Map<String, dynamic> json) => _$fromJson(json);
  Map<String, dynamic> toJson() => _$toJson(this);

}