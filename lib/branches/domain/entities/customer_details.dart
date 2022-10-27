import 'package:equatable/equatable.dart';

class CustomerDetails extends Equatable{
  final String companyName;
  final String regionName;
  final String telephon1;
  final String telephon2;
  final String addressUrl;
  final String address;
  final String email;
  final String customerId;

  const CustomerDetails({
    required this.companyName,
    required this.regionName,
    required this.telephon1,
    required this.telephon2,
    required this.addressUrl,
    required this.address,
    required this.email,
    required this.customerId,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        companyName,
        regionName,
        telephon1,
        telephon2,
        addressUrl,
        address,
        email,
        customerId,
      ];
}