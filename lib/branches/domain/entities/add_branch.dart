import 'package:equatable/equatable.dart';

class AddBranch extends Equatable{
  final String companyName;
  final String contactName;
  final String telephone1;
  final String telephone2;
  final String email;
  final String address;
  final String userId;
  final String distributorId ;
  final String regionId ;
  final String addressUrl;
  final String mainCustomerId;


  const AddBranch({
    required this.companyName,
    required this.contactName,
    required this.telephone1,
    required this.telephone2,
    required this.email,
    required this.address,
    required this.userId,
    required this.distributorId,
    required this.regionId,
    required this.addressUrl,
    required this.mainCustomerId,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        companyName,
        contactName,
        telephone1,
        telephone2,
        email,
        address,
        userId,
        distributorId,
        regionId,
        addressUrl,
        mainCustomerId,
      ];
}