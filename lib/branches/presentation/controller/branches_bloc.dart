import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:branches/branches/data/models/get_added_branch_model.dart';
import 'package:branches/branches/data/models/main_branch_model.dart';
import 'package:branches/branches/data/models/range_model.dart';
import 'package:branches/branches/data/models/region_model.dart';
import 'package:branches/branches/domain/usecase/get_region_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../core/utils/enums.dart';
import '../../data/models/customer_model.dart';
import '../../data/models/set_new_branch_model.dart';
import '../../domain/usecase/add_range_usecase.dart';
import '../../domain/usecase/add_region_usecase.dart';
import '../../domain/usecase/get_all_customers_usecase.dart';
import '../../domain/usecase/get_main_branches.dart';
import '../../domain/usecase/get_range_usecase.dart';
import '../../domain/usecase/set_new_branch_usecase.dart';
part 'branches_event.dart';
part 'branches_state.dart';

class BranchesBloc extends Bloc<BranchesEvent, BranchesState> {
  BranchesBloc(
      this.rangeUseCase,
      this.regionUseCase,
      this.mainBranchesUseCase,
      this.setNewBranchUseCase,
      this.addRegionUseCase,
      this.getAllCustomersUseCase,
      this.addRangeUseCase,
      ) : super(const BranchesState()) {
    on<GetRangeEvent>(_getRangesData);
    on<GetRegionEvent>(_getRegionData);
    on<GetMainBranchEvent>(_getMainBranches);
    on<SetNewSubBranchEvent>(_setNewSubBranch);
    on<SetNewMainBranchEvent>(_setNewMainBranch);
    on<AddNewRegionEvent>(_addRegion);
    on<GetAllCustomersEvent>(_getAllCustomers);
    on<AddNewRangeEvent>(_addRange);
  }

  final GetRangeUseCase rangeUseCase;
  final GetRegionUseCase regionUseCase;
  final GetMainBranchesUseCase mainBranchesUseCase;
  final SetNewBranchUseCase setNewBranchUseCase;
  final AddRegionUseCase addRegionUseCase;
  final AddRangeUseCase addRangeUseCase;
  final GetAllCustomersUseCase getAllCustomersUseCase;

  FutureOr<void> _getRangesData(GetRangeEvent event, Emitter<BranchesState> emit) async{
    final result = await rangeUseCase("2");
    result.fold((l) {
      emit(state.copyWith(
        getRangeState: RequestState.error,
        getRangeMessage: l.message,
      ));
    }, (r) {
      emit(state.copyWith(
        rangesData: r,
        getRangeState: RequestState.loaded,
      ));
    });
  }

  FutureOr<void> _getRegionData(GetRegionEvent event, Emitter<BranchesState> emit) async{
    emit(state.copyWith(getRegionState: RequestState.loading));
    print('retched Successfully');
    final result = await regionUseCase(GetRegionUSeCaseParameters(userId: '2', rangeId: event.rangeId.toString()));
    result.fold((l) {
      emit(
          state.copyWith(
        getRegionState: RequestState.error,
        getRegionMessage: l.message,
      ));
    }, (r) {
      emit(
          state.copyWith(
        regionData: r,
        getRegionState: RequestState.loaded,
      ));
    });
  }

  FutureOr<void> _getMainBranches(GetMainBranchEvent event, Emitter<BranchesState> emit) async{
    final result = await mainBranchesUseCase('2');
    result.fold((l) {
      emit(
          state.copyWith(
            getMainBranchesState: RequestState.error,
            getMainBranchesMessage: l.message,
          ));
    }, (r) {
      emit(
          state.copyWith(
            mainBranches: r,
            getMainBranchesState: RequestState.loaded,
          ));
    });
  }

  FutureOr<void> _setNewSubBranch(SetNewSubBranchEvent event, Emitter<BranchesState> emit) async{
    emit(state.copyWith(addBranchState: RequestState.loading,));
    final result = await setNewBranchUseCase(event.model);
    result.fold((l) {
      emit(
          state.copyWith(
            setBranchState: RequestState.error,
            addBranchState: RequestState.error,
          ));
    }, (r) {
      Fluttertoast.showToast(
        msg: r.message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5,
        backgroundColor:(r.state ==1)? Colors.green : Colors.red,
        textColor: Colors.white,
        fontSize: 18.0);
      emit(
          state.copyWith(
            addedBranchData: r,
            setBranchState: RequestState.loaded,
            addBranchState: RequestState.loaded,
          ));
    });
  }

  FutureOr<void> _setNewMainBranch(SetNewMainBranchEvent event, Emitter<BranchesState> emit) async{
    emit(state.copyWith(addMainBranchState: RequestState.loading,));
    final result = await setNewBranchUseCase(event.model);
    result.fold((l) {
      emit(
          state.copyWith(
            setBranchState: RequestState.error,
            addMainBranchState: RequestState.error,
          ));

    }, (r) {
      Fluttertoast.showToast(
          msg: r.message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor:(r.state ==1)? Colors.green : Colors.red,
          textColor: Colors.white,
          fontSize: 18.0);
      emit(
          state.copyWith(
            addMainBranchState: RequestState.loaded,
            addMainBranchSuccessResult:r.state,
          ));
    });
  }

  FutureOr<void> _addRegion(AddNewRegionEvent event, Emitter<BranchesState> emit) async{
    final result= await addRegionUseCase(event.parameters);
    result.fold((l) {
      emit(
          state.copyWith(
            addRegion: RequestState.error,
          ));

    }, (r) {
      if(r.isEmpty){
        Fluttertoast.showToast(
            msg: "${event.parameters.regionName}  موجوده بالفعل",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 5,
            backgroundColor:Colors.red,
            textColor: Colors.white,
            fontSize: 18.0);
      }
      else if(!r.isEmpty){
        Fluttertoast.showToast(
            msg: "تم إضافة المنطقه بنجاح",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 5,
            backgroundColor:Colors.green,
            textColor: Colors.white,
            fontSize: 18.0);
        emit(state.copyWith(getRegionState: RequestState.loading));
      }
      emit(
          state.copyWith(
            addRegion: RequestState.loaded,
            regionData: (r==[])? null:r,
            getRegionState: (r==[])?null:RequestState.loaded,
          ));
    });
  }

  FutureOr<void> _getAllCustomers(GetAllCustomersEvent event, Emitter<BranchesState> emit) async{
    emit(state.copyWith(getAllCustomersState: RequestState.loading));

    final result = await getAllCustomersUseCase(event.userId);
    result.fold((l) {
      emit(
          state.copyWith(
            getAllCustomersState: RequestState.error,
            getAllCustomersMessage: l.message,
          ));
    }, (r) {
      emit(
          state.copyWith(
            allCustomers: r,
            getAllCustomersState: RequestState.loaded,
          ));
    });
  }


  FutureOr<void> _addRange(AddNewRangeEvent event, Emitter<BranchesState> emit) async{
    emit(state.copyWith(getRangeState: RequestState.loading));
    final result= await addRangeUseCase(event.parameters);
    result.fold((l) {
      emit(
          state.copyWith(
            addRange: RequestState.error,
          ));

    }, (r) {
      print('R is  --> '+r.toString());
      if(r.isEmpty){
        Fluttertoast.showToast(
            msg: "${event.parameters.rangeName}  موجوده بالفعل",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 5,
            backgroundColor:Colors.red,
            textColor: Colors.white,
            fontSize: 18.0);
        emit(
            state.copyWith(
              getRangeState: RequestState.loaded,
            ));
      }
      else if(!r.isEmpty){
        Fluttertoast.showToast(
            msg: "تم إضافة المنطقه بنجاح",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 5,
            backgroundColor:Colors.green,
            textColor: Colors.white,
            fontSize: 18.0);
        emit(state.copyWith(getRegionState: RequestState.loading));
      }
      emit(
          state.copyWith(
            addRange: RequestState.loaded,
            rangesData: (r==[])? null:r,
            getRangeState:RequestState.loaded,
          ));
    });
  }
}
