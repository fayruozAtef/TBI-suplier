import 'package:branches/branches/domain/entities/range.dart';

class RangeModel extends Range{
  const RangeModel({
    required super.rangeName,
    required super.rangeId,
  });

  factory RangeModel.fromJson(Map<String, dynamic> json) => RangeModel(
        rangeName: json['Range'],
        rangeId: json['RecordID'],
  );
}