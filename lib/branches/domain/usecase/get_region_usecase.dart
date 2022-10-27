
import 'package:branches/branches/data/models/region_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../repository/base_repository.dart';

class GetRegionUseCase extends BaseUseCase<List<RegionModel>,GetRegionUSeCaseParameters> {
  final BaseRepository baseRepository;

  GetRegionUseCase(this.baseRepository);

  @override
  Future<Either<Failure, List<RegionModel>>> call(GetRegionUSeCaseParameters parameters) {
    // TODO: implement call
    return baseRepository.getRegions(parameters);
  }
}

class GetRegionUSeCaseParameters extends Equatable{
  final String userId;
  final String rangeId;

  const GetRegionUSeCaseParameters({
    required this.userId,
    required this.rangeId,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        userId,
        rangeId,
  ];
}