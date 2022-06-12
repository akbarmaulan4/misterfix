part of 'profile_model.dart';
ProfileModel _$fromJson(Map<String, dynamic> json) {
  return ProfileModel()
    ..id = json['id'] ?? -1
    ..name = json['name'] ?? ''
    ..avatar = json['avatar'] ?? ''
    ..email = json['email'] ?? ''
    ..email_verified_at = json['email_verified_at'] ?? ''
    ..telpon = json['telpon'] ?? ''
    ..desc = json['desc'] ?? ''
    ..jenis_kelamin = json['jenis_kelamin'] ?? ''
    ..role = json['role'] ?? ''
    ..status = json['status'] ?? -1
    ..expertize = (json['expertize'] as List).map((e) => e == null ? null : ModelItemKeahlian.fromJson(e as Map<String, dynamic>)).toList()
    ..provider = json['provider'] != null ?  ModelProviderProfile.fromJson(json['provider']):ModelProviderProfile()
  ;
}

Map<String, dynamic> _$toJson(ProfileModel instance) =>
    <String, dynamic> {
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'email': instance.email,
      'email_verified_at': instance.email_verified_at,
      'telpon': instance.telpon,
      'desc': instance.desc,
      'jenis_kelamin': instance.jenis_kelamin,
      'role': instance.role,
      'status': instance.status,
      'expertize': instance.expertize,
      'provider': instance.provider,
    };