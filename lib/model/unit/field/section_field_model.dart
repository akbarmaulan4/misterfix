import 'package:misterfix/model/unit/field/field_model.dart';
part 'section_field_model.g.dart';
class SectionFieldModel{
  SectionFieldModel(){}
  String name = '';
  List values = [];

  factory SectionFieldModel.fromJson(Map<String, dynamic> json) => _$fromJson(json);
  Map<String, dynamic> toJson() => _$toJson(this);

}