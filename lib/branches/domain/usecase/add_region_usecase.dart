import 'package:branches/branches/data/models/region_model.dart';
import 'package:branches/core/error/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/usecase/base_usecase.dart';
import '../repository/base_repository.dart';

class AddRegionUseCase extends BaseUseCase<List<RegionModel>,AddRegionParameters>{
  final BaseRepository baseRepository;

  AddRegionUseCase(this.baseRepository);

  @override
  Future<Either<Failure, List<RegionModel>>> call(AddRegionParameters parameters) {
    // TODO: implement call
    return baseRepository.addRegion(parameters);
  }


}

class AddRegionParameters extends Equatable{
  final String userId;
  final String rangeId;
  final String regionName;

  const AddRegionParameters({
    required this.userId,
    required this.rangeId,
    required this.regionName,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        userId,
        rangeId,
        regionName,
      ];
}