import 'package:branches/branches/domain/entities/branch_added_result.dart';

class AddBranchDataModel extends BranchAddedResult{
  const AddBranchDataModel({
    required super.state,
    required super.message,
  });
  factory AddBranchDataModel.fromJson(Map<String, dynamic> json) => AddBranchDataModel(
    state: json['State'],
    message: json['Message'],
  );
}