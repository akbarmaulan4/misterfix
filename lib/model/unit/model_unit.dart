part 'model_unit.g.dart';
class ModelUnit{
  ModelUnit(){}
  int id = -1;
  String code = '';
  int user_id = -1;
  String customer_id = '';
  int location_id = -1;
  String pemasangan = '';
  String message = '';
  int service_category_id = -1;

  factory ModelUnit.fromJson(Map<String, dynamic> json) => _$fromJson(json);
  Map<String, dynamic> toJson() => _$toJson(this);

}