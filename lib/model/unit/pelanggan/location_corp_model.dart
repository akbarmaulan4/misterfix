part 'location_corp_model.g.dart';
class LocationCorpModel{
  LocationCorpModel(){}
  int id = -1;
  int customer_id = -1;
  String name = '';
  String address = '';
  String phone_number = '';
  String lat = '';
  String lng = '';

  factory LocationCorpModel.fromJson(Map<String, dynamic> json) => _$fromJson(json);
  Map<String, dynamic> toJson() => _$toJson(this);

}