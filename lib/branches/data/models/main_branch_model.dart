import 'package:branches/branches/domain/entities/main_branch.dart';

class MainBranchModel extends MainBranch{
  const MainBranchModel({
    required super.customerId,
    required super.companyName,
  });

  factory MainBranchModel.fromJson(Map<String , dynamic>json)=>MainBranchModel(
    customerId: json['Customer_ID'].toString(),
    companyName: json['CompanyName'],
  );
}