part of 'pelanggan_corp_model.dart';
PelangganCorpModel _$fromJson(Map<String, dynamic> json) {
  return PelangganCorpModel()
    ..id = json['id'] ?? -1
    ..code = json['code'] ?? ''
    ..category = json['category'] ?? ''
    ..locations = (json['locations'] as List).map((e) => e == null ? null : LocationCorpModel.fromJson(e as Map<String, dynamic>)).toList()
    ..corp_name = json['customer']['name']  ?? ''
  ;
}

Map<String, dynamic> _$toJson(PelangganCorpModel instance) =>
    <String, dynamic> {
      'id': instance.id,
      'code': instance.code,
      'category': instance.category,
      'corp_name': instance.corp_name,
    };