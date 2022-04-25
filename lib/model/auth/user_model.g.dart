part of 'user_model.dart';
UserModel _$fromJson(Map<String, dynamic> json) {
  return UserModel()
    ..email = json['email'] ?? ''
    ..telp = json['telp'] ?? ''
  ;
}

Map<String, dynamic> _$toJson(UserModel instance) =>
    <String, dynamic> {
      'email': instance.email,
      'telp': instance.telp
    };