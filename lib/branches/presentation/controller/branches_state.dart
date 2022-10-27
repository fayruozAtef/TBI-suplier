part of 'branches_bloc.dart';

class BranchesState extends Equatable {

  final List<RangeModel> rangesData;
  final RequestState getRangeState;
  final String getRangeMessage;
  final List<RegionModel> regionData;
  final RequestState getRegionState;
  final String getRegionMessage;
  final List<MainBranchModel> mainBranches;
  final RequestState getMainBranchesState;
  final String getMainBranchesMessage;
  final AddBranchDataModel addedBranchData;
  final RequestState setBranchState;
  final RequestState addBranchState;
  final RequestState addMainBranchState;
  final int addMainBranchSuccessResult;
  final RequestState addRegion;

  const BranchesState({
    this.rangesData=const [],
    this.getRangeState= RequestState.loading,
    this.getRangeMessage='',
    this.regionData=const [],
    this.getRegionState= RequestState.loading,
    this.getRegionMessage='',
    this.mainBranches=const [],
    this.getMainBranchesState= RequestState.loading,
    this.getMainBranchesMessage='',
    this.addedBranchData=const AddBranchDataModel(
      state: -1,
      message: '',
    ),
    this.setBranchState= RequestState.loading,
    this.addBranchState=RequestState.error,
    this.addMainBranchState=RequestState.error,
    this.addMainBranchSuccessResult=0,
    this.addRegion=RequestState.loading,
  });

  BranchesState copyWith({
    List<RangeModel>? rangesData,
    RequestState? getRangeState,
    String? getRangeMessage,
    List<RegionModel>? regionData,
    RequestState? getRegionState,
    String? getRegionMessage,
    List<MainBranchModel>? mainBranches,
    RequestState? getMainBranchesState,
    String? getMainBranchesMessage,
    AddBranchDataModel? addedBranchData,
    RequestState? setBranchState,
    RequestState? addBranchState,
    RequestState? addMainBranchState,
    int? addMainBranchSuccessResult,
    RequestState? addRegion,
  }) => BranchesState(
    rangesData: rangesData?? this.rangesData,
    getRangeState: getRangeState ?? this.getRangeState,
    getRangeMessage: getRangeMessage ?? this.getRangeMessage,
    regionData: regionData?? this.regionData,
    getRegionState: getRegionState ?? this.getRegionState,
    getRegionMessage: getRegionMessage ?? this.getRegionMessage,
    mainBranches: mainBranches?? this.mainBranches,
    getMainBranchesState: getMainBranchesState ?? this.getMainBranchesState,
    getMainBranchesMessage: getMainBranchesMessage ?? this.getMainBranchesMessage,
    addedBranchData: addedBranchData?? this.addedBranchData,
    setBranchState: setBranchState ?? this.setBranchState,
    addBranchState: addBranchState?? this.addBranchState,
    addMainBranchState: addMainBranchState?? this.addMainBranchState,
    addMainBranchSuccessResult: addMainBranchSuccessResult ?? this.addMainBranchSuccessResult,
    addRegion: addRegion ?? this.addRegion,
  );

  @override
  // TODO: implement props
  List<Object?> get props => [
        rangesData,
        getRangeState,
        getRangeMessage,
        regionData,
        getRegionState,
        getRegionMessage,
        mainBranches,
        getMainBranchesState,
        getMainBranchesMessage,
        addedBranchData,
        setBranchState,
        addBranchState,
        addMainBranchState,
        addRegion,
      ];
}
