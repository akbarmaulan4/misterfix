part 'user_model.g.dart';
class UserModel{
  UserModel(){}
  String email = '';
  String telp = '';

  factory UserModel.fromJson(Map<String, dynamic> json) => _$fromJson(json);
  Map<String, dynamic> toJson() => _$toJson(this);

}