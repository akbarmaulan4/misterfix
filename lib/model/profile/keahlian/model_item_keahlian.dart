import 'package:misterfix/model/profile/keahlian/model_pivot_expertize.dart';

part 'model_item_keahlian.g.dart';
class ModelItemKeahlian{
  ModelItemKeahlian(){}
  int id = -1;
  String name = '';
  int status = -1;
  String slug = '';
  ModelPivotKeahlian pivot = ModelPivotKeahlian();

  factory ModelItemKeahlian.fromJson(Map<String, dynamic> json) => _$fromJson(json);
  Map<String, dynamic> toJson() => _$toJson(this);

}