part 'pelanggan_model.g.dart';
class PelangganModel{
  PelangganModel(){}
  int id = -1;
  String name = '';
  String no_telpon = '';

  factory PelangganModel.fromJson(Map<String, dynamic> json) => _$fromJson(json);
  Map<String, dynamic> toJson() => _$toJson(this);

}