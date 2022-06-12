part of 'model_success_unit.dart';
ModelSuccesUnit _$fromJson(Map<String, dynamic> json) {
  return ModelSuccesUnit()
    ..code = json['code'] ?? ''
    ..unit = json['unit'] ?? ''
    ..location_unit = json['location_unit'] ?? ''
    ..nama_tempat = json['nama_tempat'] ?? ''
    ..alamat = json['alamat'] ?? ''
    ..nama_pelanggan = json['nama_pelanggan'] ?? ''
    ..tlp_pelanggan = json['tlp_pelanggan'] ?? ''
    ..tgl_pasang = json['tgl_pasang'] ?? ''
  ;
}

Map<String, dynamic> _$toJson(ModelSuccesUnit instance) =>
    <String, dynamic> {
      'code': instance.code,
      'unit': instance.unit,
      'location_unit': instance.location_unit,
      'nama_tempat': instance.nama_tempat,
      'alamat': instance.alamat,
      'nama_pelanggan': instance.nama_pelanggan,
      'tlp_pelanggan': instance.tlp_pelanggan,
      'tgl_pasang': instance.tgl_pasang,
    };