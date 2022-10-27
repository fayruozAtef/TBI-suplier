part of 'branches_bloc.dart';

abstract class BranchesEvent extends Equatable {
  const BranchesEvent();
}

class GetRangeEvent extends BranchesEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class GetRegionEvent extends BranchesEvent{
  final int rangeId;

  const GetRegionEvent(this.rangeId);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class GetMainBranchEvent extends BranchesEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class SetNewSubBranchEvent extends BranchesEvent{
  final SetNewBranchModel model;

  const SetNewSubBranchEvent(this.model);

  @override
  // TODO: implement props
  List<Object?> get props => [model];

}

class SetNewMainBranchEvent extends BranchesEvent{
  final SetNewBranchModel model;

  const SetNewMainBranchEvent(this.model);

  @override
  // TODO: implement props
  List<Object?> get props => [model];

}

class AddNewRegionEvent extends BranchesEvent{
  final AddRegionParameters parameters;

  const AddNewRegionEvent(this.parameters);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class GetAllCustomersEvent extends BranchesEvent{
  final String userId;

  const GetAllCustomersEvent(this.userId);

  @override
  // TODO: implement props
  List<Object?> get props => [userId];

}

class GetCustomerDetails extends BranchesEvent{
  final String customerId;
  final String userId;

  const GetCustomerDetails({
    required this.customerId,
    required this.userId,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        customerId,
        userId,
      ];
}