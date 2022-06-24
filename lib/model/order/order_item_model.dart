import 'package:misterfix/model/order/booking_model.dart';
import 'category_service_model.dart';
class OrderItemModel{
  OrderItemModel(){}
  int? id;
  int? booking_id;
  int? unit_id;
  int? service_category_id;
  int? provider_id;
  String? customer_note;
  String? status;
  String? created_at;
  String? updated_at;
  BookingModel? booking;
  String? unit;
  CategoryServiceModel? service_category;

  factory OrderItemModel.fromJson(Map<String, dynamic> json) => _$fromJson(json);
  Map<String, dynamic> toJson() => _$toJson(this);
}

OrderItemModel _$fromJson(Map<String, dynamic> json) {
  return OrderItemModel()
    ..id = json['id'] ?? -1
    ..booking_id = json['booking_id'] ?? -1
    ..unit_id = json['unit_id'] ?? -1
    ..service_category_id = json['service_category_id'] ?? -1
    ..provider_id = json['provider_id'] ?? -1
    ..customer_note = json['customer_note'] ?? ''
    ..status = json['status'] ?? ''
    ..created_at = json['created_at'] ?? ''
    ..updated_at = json['updated_at'] ?? ''
    ..booking =  json['booking'] != null ? BookingModel.fromJson(json['booking']) : null
    ..unit = json['unit'] ?? ''
    ..service_category = json['service_category'] != null ?  CategoryServiceModel.fromJson(json['service_category']):CategoryServiceModel()
  ;
}

Map<String, dynamic> _$toJson(OrderItemModel instance) =>
    <String, dynamic> {
      'id': instance.id,
      'booking_id': instance.booking_id,
      'unit_id': instance.unit_id,
      'service_category_id': instance.service_category_id,
      'provider_id': instance.provider_id,
      'customer_note': instance.customer_note,
      'status': instance.status,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'booking': instance.booking,
      'unit': instance.unit,
      'service_category': instance.service_category
    };