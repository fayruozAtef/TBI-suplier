import 'package:branches/core/error/failure.dart';
import 'package:branches/core/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/main_branch_model.dart';
import '../repository/base_repository.dart';

class GetMainBranchesUseCase extends BaseUseCase<List<MainBranchModel>,String>{

  final BaseRepository baseRepository;

  GetMainBranchesUseCase(this.baseRepository);

  @override
  Future<Either<Failure, List<MainBranchModel>>> call(String parameters) {
    // TODO: implement call
    return baseRepository.getMainBranches(parameters);
  }

}