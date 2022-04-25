part 'item_field_model.g.dart';
class ItemFieldModel{
  ItemFieldModel(){}
  int id = -1;
  int fields_id = -1;
  String value = '';

  factory ItemFieldModel.fromJson(Map<String, dynamic> json) => _$fromJson(json);
  Map<String, dynamic> toJson() => _$toJson(this);

}