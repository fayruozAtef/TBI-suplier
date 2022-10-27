import 'package:branches/branches/domain/entities/customer.dart';

class CustomerModel extends Customer{
  const CustomerModel({
    required super.customerName,
    required super.customerId,
  });

  factory CustomerModel.fromJson(Map<String , dynamic>json)=>CustomerModel(
    customerName: json['item'],
    customerId: json['Customer_ID'],
  );
}