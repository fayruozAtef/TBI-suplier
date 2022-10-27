import 'package:branches/branches/domain/entities/customer_details.dart';

class CustomerDetailsModel extends CustomerDetails{
  const CustomerDetailsModel({
    required super.companyName,
    required super.regionName,
    required super.telephon1,
    required super.telephon2,
    required super.addressUrl,
    required super.address,
    required super.email,
    required super.customerId,
  });

  factory CustomerDetailsModel.fromJson(Map<String, dynamic> json) =>
      CustomerDetailsModel(
        companyName: json['CompanyName'],
        regionName: json['Region'],
        telephon1: json['CusTel1'],
        telephon2: json['CusTel2'],
        addressUrl: json['AddressUrl'],
        address: json['CusAddress'],
        email: json['Email'],
        customerId: json['Customer_ID'],
      );
}