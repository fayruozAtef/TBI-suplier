import 'package:equatable/equatable.dart';

class Region extends Equatable{
  final String regionName;
  final String regionId;

  const Region({
    required this.regionName,
    required this.regionId,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        regionName,
        regionId,
      ];
}