part 'model_provider_profile.g.dart';
class ModelProviderProfile{
  ModelProviderProfile(){}
  int id = -1;
  String user = '';
  String code = '';
  String detail = '';
  String date_of_birth = '';

  factory ModelProviderProfile.fromJson(Map<String, dynamic> json) => _$fromJson(json);
  Map<String, dynamic> toJson() => _$toJson(this);

}