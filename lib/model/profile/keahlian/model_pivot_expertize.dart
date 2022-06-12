part 'model_pivot_expertize.g.dart';
class ModelPivotKeahlian{
  ModelPivotKeahlian(){}
  int user_id = -1;
  int service_category_id = -1;

  factory ModelPivotKeahlian.fromJson(Map<String, dynamic> json) => _$fromJson(json);
  Map<String, dynamic> toJson() => _$toJson(this);

}