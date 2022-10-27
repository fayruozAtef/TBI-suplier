import 'package:branches/branches/data/models/customer_details_model.dart';
import 'package:branches/branches/data/models/customer_model.dart';
import 'package:branches/branches/data/models/main_branch_model.dart';
import 'package:branches/branches/data/models/range_model.dart';
import 'package:branches/branches/domain/usecase/add_region_usecase.dart';
import 'package:dio/dio.dart';
import '../../../core/error/exception.dart';
import '../../../core/network/api_constances.dart';
import '../../../core/network/error_message_model.dart';
import '../../domain/usecase/get_customer_details_usecase.dart';
import '../../domain/usecase/get_region_usecase.dart';
import '../models/get_added_branch_model.dart';
import '../models/region_model.dart';
import '../models/set_new_branch_model.dart';

abstract class BaseRemoteDataSource {
  Future<List<RangeModel>> getRanges(String userId);
  Future<List<RegionModel>> getRegions(GetRegionUSeCaseParameters parameters);
  Future<List<RegionModel>> addRegions(AddRegionParameters parameters);
  Future<List<MainBranchModel>> getMainBranches(String parameters);
  Future<AddBranchDataModel> setNewSubBranchModel(SetNewBranchModel parameters);
  Future<AddBranchDataModel> setNewMainBranchModel(SetNewBranchModel parameters);
  Future<List<CustomerModel>> getAllCustomers(String parameters);
  Future<CustomerDetailsModel> getCustomerDetails(GetCustomerDetailsParameters parameters);
}
class RemoteDataSource extends BaseRemoteDataSource{

  @override
  Future<List<RangeModel>> getRanges(String userId) async {
    final response = await Dio().get(
      ApiConstance.getRange(userId),
    );
    if(response.statusCode==200){
      return List<RangeModel>.from((response.data['data'] as List).map((e) => RangeModel.fromJson(e)));
    }else{
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RegionModel>> getRegions(GetRegionUSeCaseParameters parameters) async {
    final response = await Dio().get(
      ApiConstance.getRegion(userId: parameters.userId, rangeId: parameters.rangeId),
    );
    if(response.statusCode==200){
      if(response.data['State']==1) {
        return List<RegionModel>.from((response.data['data'] as List)
            .map((e) => RegionModel.fromJson(e)));
      }
      else{
        return [];
      }
    }else{
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MainBranchModel>> getMainBranches(String parameters) async {
    final response = await Dio().get(
      ApiConstance.getMainBranches(userId: parameters),
    );
    if(response.statusCode==200){
      if(response.data['State']==1) {
        return List<MainBranchModel>.from((response.data['data'] as List)
            .map((e) => MainBranchModel.fromJson(e)));
      }
      else{
        return [];
      }
    }else{
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<AddBranchDataModel> setNewSubBranchModel(SetNewBranchModel parameters) async {
    print('Object Data --> '+parameters.toString());
    final response = await Dio().post(
      ApiConstance.setNewSubBranch,
      data: parameters.toJson(),
    );
    if(response.statusCode==200){
      print('response -->  '+response.data.toString());
      return AddBranchDataModel.fromJson(response.data);
    }else{
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<AddBranchDataModel> setNewMainBranchModel(SetNewBranchModel parameters) async {
    final response = await Dio().post(
      ApiConstance.setNewMainBranch,
      data: parameters.toJson(),
    );
    if(response.statusCode==200){
      print('response -->  '+response.data.toString());
      return AddBranchDataModel.fromJson(response.data);
    }else{
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RegionModel>> addRegions(AddRegionParameters parameters) async{
    // TODO: implement addRegions
    final response = await Dio().post(
      ApiConstance.addRegion,
      data: {
        "UserID": parameters.userId,
        "Region": parameters.regionName,
        "Range_Id": parameters.rangeId
      },
    );
    if(response.statusCode==200){
      if(response.data['State']==1) {
        return List<RegionModel>.from((response.data['data'] as List)
            .map((e) => RegionModel.fromJson(e)));
      }
      else{
        return [];
      }
    }else{
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<CustomerModel>> getAllCustomers(String parameters) async{
    // TODO: implement addRegions
    final response = await Dio().get(
      ApiConstance.getAllCustomers(userId: parameters),
    );
    if(response.statusCode==200){
      if(response.data['State']==1) {
        return List<CustomerModel>.from((response.data['data'] as List).map((e) => CustomerModel.fromJson(e)));
      }
      else{
        return [];
      }
    }else{
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<CustomerDetailsModel> getCustomerDetails(GetCustomerDetailsParameters parameters) async{
    // TODO: implement getCustomerDetails
    final response = await Dio().get(
      ApiConstance.getCustomerDetails(userId: parameters.userId,customerId: parameters.customerId),
    );
    if(response.statusCode==200){
      return CustomerDetailsModel.fromJson(response.data['Item']);
    }else{
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}