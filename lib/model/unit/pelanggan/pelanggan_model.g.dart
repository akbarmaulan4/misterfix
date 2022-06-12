part of 'pelanggan_model.dart';
PelangganModel _$fromJson(Map<String, dynamic> json) {
  return PelangganModel()
    ..id = json['id'] ?? -1
    ..name = json['name'] ?? ''
    ..telpon = json['telpon'] ?? ''
  ;
}

Map<String, dynamic> _$toJson(PelangganModel instance) =>
    <String, dynamic> {
      'id': instance.id,
      'name': instance.name,
      'telpon': instance.telpon
    };