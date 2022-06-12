part 'model_success_unit.g.dart';
class ModelSuccesUnit{
  ModelSuccesUnit(){}
  String code = '';
  String unit = '';
  String location_unit = '';
  String nama_tempat = '';
  String alamat = '';
  String nama_pelanggan = '';
  String tlp_pelanggan = '';
  String tgl_pasang = '';

  factory ModelSuccesUnit.fromJson(Map<String, dynamic> json) => _$fromJson(json);
  Map<String, dynamic> toJson() => _$toJson(this);

}