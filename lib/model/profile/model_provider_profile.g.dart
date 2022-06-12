part of 'model_provider_profile.dart';
ModelProviderProfile _$fromJson(Map<String, dynamic> json) {
  return ModelProviderProfile()
    ..id = json['id'] ?? -1
    ..user = json['user'] ?? ''
    ..code = json['code'] ?? ''
    ..detail = json['detail'] ?? ''
    ..date_of_birth = json['date_of_birth'] ?? ''
  ;
}

Map<String, dynamic> _$toJson(ModelProviderProfile instance) =>
    <String, dynamic> {
      'id': instance.id,
      'user': instance.user,
      'code': instance.code,
      'detail': instance.detail,
      'date_of_birth': instance.date_of_birth
    };