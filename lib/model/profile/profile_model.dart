part 'profile_model.g.dart';
class ProfileModel{
  ProfileModel(){}
  int id = -1;
  String name = '';
  String avatar = '';
  String email = '';
  String email_verified_at = '';
  String telpon = '';
  String desc = '';
  String jenis_kelamin = '';
  String role = '';
  int status = -1;
  List<String> expertize = [];
  String provider = '';

  factory ProfileModel.fromJson(Map<String, dynamic> json) => _$fromJson(json);
  Map<String, dynamic> toJson() => _$toJson(this);

}