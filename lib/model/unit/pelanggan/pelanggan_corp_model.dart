import 'package:misterfix/model/unit/pelanggan/location_corp_model.dart';
part 'pelanggan_corp_model.g.dart';

class PelangganCorpModel{
  PelangganCorpModel(){}
  int id = -1;
  String code = '';
  String category = '';
  List<LocationCorpModel?> locations = [];
  String corp_name = '';

  factory PelangganCorpModel.fromJson(Map<String, dynamic> json) => _$fromJson(json);
  Map<String, dynamic> toJson() => _$toJson(this);

}