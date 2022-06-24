
class BookingModel{
  BookingModel(){}
  int? id;
  int? customer_id;
  String? no_transaksi;
  int? created_by;
  String? status;
  int? location_id;
  String? date_service;
  String? created_at;
  String? updated_at;

  factory BookingModel.fromJson(Map<String, dynamic> json) => _$fromJson(json);
  Map<String, dynamic> toJson() => _$toJson(this);
}

BookingModel _$fromJson(Map<String, dynamic> json) {
  return BookingModel()
    ..id = json['id'] ?? -1
    ..customer_id = json['customer_id'] ?? -1
    ..no_transaksi = json['no_transaksi'] ?? ''
    ..created_by = json['created_by'] ?? -1
    ..status = json['status'] ?? ''
    ..location_id = json['location_id'] ?? -1
    ..date_service = json['date_service'] ?? ''
    ..created_at = json['created_at'] ?? ''
    ..updated_at = json['updated_at'] ?? ''
  ;
}

Map<String, dynamic> _$toJson(BookingModel instance) =>
    <String, dynamic> {
      'id': instance.id,
      'customer_id': instance.customer_id,
      'no_transaksi': instance.no_transaksi,
      'created_by': instance.created_by,
      'status': instance.status,
      'location_id': instance.location_id,
      'date_service': instance.date_service,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at
    };