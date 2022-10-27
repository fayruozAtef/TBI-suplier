import 'package:branches/branches/domain/entities/region.dart';

class RegionModel extends Region{
  const RegionModel({
    required super.regionName,
    required super.regionId,
  });

  factory RegionModel.fromJson(Map<String, dynamic> json) => RegionModel(
        regionName: json['Region'],
        regionId: json['RecordID'].toString(),
  );
}