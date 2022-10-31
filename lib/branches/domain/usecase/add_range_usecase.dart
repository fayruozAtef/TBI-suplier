import 'package:branches/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/usecase/base_usecase.dart';
import '../../data/models/range_model.dart';
import '../repository/base_repository.dart';

class AddRangeUseCase extends BaseUseCase<List<RangeModel>,AddRangeParameters>{
  final BaseRepository baseRepository;

  AddRangeUseCase(this.baseRepository);

  @override
  Future<Either<Failure, List<RangeModel>>> call(AddRangeParameters parameters) {
    // TODO: implement call
    return baseRepository.addRange(parameters);
  }


}

class AddRangeParameters extends Equatable{
  final String userId;
  final String rangeName;

  const AddRangeParameters({
    required this.userId,
    required this.rangeName,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        userId,
        rangeName,
      ];
}