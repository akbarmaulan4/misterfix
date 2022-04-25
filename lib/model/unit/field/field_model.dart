import 'package:misterfix/model/unit/field/item_field_model.dart';

part 'field_model.g.dart';
class FieldModel{
  FieldModel(){}
  int id = -1;
  int service_category_id = -1;
  String name = '';
  String category = '';
  List<ItemFieldModel?> values = [];

  factory FieldModel.fromJson(Map<String, dynamic> json) => _$fromJson(json);
  Map<String, dynamic> toJson() => _$toJson(this);

}