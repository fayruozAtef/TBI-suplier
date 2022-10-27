import 'package:branches/branches/data/models/get_added_branch_model.dart';
import 'package:branches/branches/data/models/set_new_branch_model.dart';
import 'package:branches/core/error/failure.dart';
import 'package:branches/core/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../repository/base_repository.dart';

class SetNewBranchUseCase extends BaseUseCase<AddBranchDataModel,SetNewBranchModel>{
  final BaseRepository baseRepository;

  SetNewBranchUseCase(this.baseRepository);

  @override
  Future<Either<Failure, AddBranchDataModel>> call(SetNewBranchModel parameters) {
    // TODO: implement call
    if(parameters.mainCustomerId=='') {
      return baseRepository.setNewMainBranch(parameters);
    }
    else {
      return baseRepository.setNewSubBranch(parameters);
    }
  }


}
class SetNewSubBranchParameters extends Equatable{
  final SetNewBranchModel branch;

  const SetNewSubBranchParameters(this.branch);

  @override
  // TODO: implement props
  List<Object?> get props => [branch];

}