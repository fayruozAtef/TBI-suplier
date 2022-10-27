import 'package:branches/branches/data/data_source/remote_datasource.dart';
import 'package:branches/branches/data/models/get_added_branch_model.dart';
import 'package:branches/branches/data/models/main_branch_model.dart';
import 'package:branches/branches/data/models/range_model.dart';
import 'package:branches/branches/data/models/region_model.dart';
import 'package:branches/branches/domain/repository/base_repository.dart';
import 'package:branches/branches/domain/usecase/add_region_usecase.dart';
import 'package:branches/branches/domain/usecase/get_region_usecase.dart';
import 'package:branches/branches/domain/usecase/set_new_branch_usecase.dart';
import 'package:branches/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/exception.dart';
import '../models/set_new_branch_model.dart';

class BranchesRepository extends BaseRepository{
  final BaseRemoteDataSource baseRemoteDataSource;

  BranchesRepository(this.baseRemoteDataSource);

  @override
  Future<Either<Failure, List<RangeModel>>> getRanges(String userID) async{
    final result =await baseRemoteDataSource.getRanges(userID);
    try{
      return Right(result);
    }on ServerException catch(fail){
      return Left(ServerFailure(message: fail.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, AddBranchDataModel>> setNewSubBranch(SetNewBranchModel parameter) async{
    final result =await baseRemoteDataSource.setNewSubBranchModel(parameter);
    try{
      return Right(result);
    }on ServerException catch(fail){
      return Left(ServerFailure(message: fail.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<RegionModel>>> getRegions(GetRegionUSeCaseParameters parameters) async{
    final result =await baseRemoteDataSource.getRegions(parameters);
    try{
      return Right(result);
    }on ServerException catch(fail){
      return Left(ServerFailure(message: fail.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MainBranchModel>>> getMainBranches(String parameters) async{
    final result =await baseRemoteDataSource.getMainBranches(parameters);
    try{
      return Right(result);
    }on ServerException catch(fail){
      return Left(ServerFailure(message: fail.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, AddBranchDataModel>> setNewMainBranch(SetNewBranchModel parameter) async{
    // TODO: implement setNewMainBranch
    final result =await baseRemoteDataSource.setNewMainBranchModel(parameter);
    try{
      return Right(result);
    }on ServerException catch(fail){
      return Left(ServerFailure(message: fail.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<RegionModel>>> addRegion(AddRegionParameters parameters) async{
    // TODO: implement addRegion
    final result =await baseRemoteDataSource.addRegions(parameters);
    try{
      return Right(result);
    }on ServerException catch(fail){
      return Left(ServerFailure(message: fail.errorMessageModel.statusMessage));
    }
  }

}