import 'package:branches/branches/data/models/range_model.dart';
import 'package:branches/core/error/failure.dart';
import 'package:branches/core/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../repository/base_repository.dart';

class GetRangeUseCase extends BaseUseCase<List<RangeModel>,String>{
  final BaseRepository baseRepository;

  GetRangeUseCase(this.baseRepository);

  @override
  Future<Either<Failure, List<RangeModel>>> call(String parameters) {
    // TODO: implement call
    return baseRepository.getRanges(parameters);
  }





}
