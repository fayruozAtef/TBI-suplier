import 'package:branches/branches/data/models/get_added_branch_model.dart';
import 'package:branches/branches/data/models/main_branch_model.dart';
import 'package:branches/branches/data/models/range_model.dart';
import 'package:branches/branches/data/models/region_model.dart';
import 'package:branches/branches/domain/usecase/get_region_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../data/models/set_new_branch_model.dart';
import '../usecase/add_region_usecase.dart';

abstract class BaseRepository{
  Future<Either<Failure, AddBranchDataModel>> setNewSubBranch(SetNewBranchModel parameter);
  Future<Either<Failure, AddBranchDataModel>> setNewMainBranch(SetNewBranchModel parameter);
  Future<Either<Failure,List<RangeModel>>> getRanges(String userID);
  Future<Either<Failure,List<RegionModel>>> getRegions(GetRegionUSeCaseParameters parameters);
  Future<Either<Failure,List<RegionModel>>> addRegion(AddRegionParameters parameters);
  Future<Either<Failure,List<MainBranchModel>>> getMainBranches(String parameters);
}