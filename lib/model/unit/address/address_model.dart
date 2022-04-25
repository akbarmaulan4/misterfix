part 'address_model.g.dart';
class AddressModel{
  AddressModel(){}
  int id = -1;
  int customer_id = -1;
  String name = '';
  String address = '';
  String phone_number = '';
  String lat = '';
  String lng = '';

  factory AddressModel.fromJson(Map<String, dynamic> json) => _$fromJson(json);
  Map<String, dynamic> toJson() => _$toJson(this);

}