import 'package:branches/branches/domain/entities/add_branch.dart';

class SetNewBranchModel extends AddBranch{
  const SetNewBranchModel({
    required super.companyName,
    required super.contactName,
    required super.telephone1,
    required super.telephone2,
    required super.email,
    required super.address,
    required super.userId,
    required super.distributorId,
    required super.regionId,
    required super.addressUrl,
    required super.mainCustomerId,
  });

  Map<String, dynamic> toJson() => {

    "CompanyName": companyName,
    "ContactName": contactName,
    "Telephone1": telephone1,
    "Telephone2": telephone2,
    "Email": email,
    "Address": address,
    "UserID": "2",
    "Distributor_ID": "2",
    "Region_ID": regionId,
    "AddressUrl": addressUrl.substring(addressUrl.indexOf('https://')),
    "Main_CusId": mainCustomerId
  };
}