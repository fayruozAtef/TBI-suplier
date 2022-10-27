import 'package:equatable/equatable.dart';

class NewRegion extends Equatable{
  final String userId;
  final String regionName;
  final String rangeId;

  const NewRegion(
    this.userId,
    this.regionName,
    this.rangeId,
  );

  @override
  // TODO: implement props
  List<Object?> get props => [
        userId,
        regionName,
        rangeId,
      ];
}