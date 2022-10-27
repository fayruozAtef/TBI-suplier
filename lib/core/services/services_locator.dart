import 'package:branches/branches/data/repository/branches_repository.dart';
import 'package:branches/branches/domain/repository/base_repository.dart';
import 'package:get_it/get_it.dart';

import '../../branches/data/data_source/remote_datasource.dart';
import '../../branches/domain/usecase/add_region_usecase.dart';
import '../../branches/domain/usecase/get_all_customers_usecase.dart';
import '../../branches/domain/usecase/get_customer_details_usecase.dart';
import '../../branches/domain/usecase/get_main_branches.dart';
import '../../branches/domain/usecase/get_range_usecase.dart';
import '../../branches/domain/usecase/get_region_usecase.dart';
import '../../branches/domain/usecase/set_new_branch_usecase.dart';
import '../../branches/presentation/controller/branches_bloc.dart';
import '../../branches/presentation/controller/customer_details_bloc.dart';
final serviceLocator=GetIt.instance;
class ServicesLocator{
  void init(){
    ///Bloc
    serviceLocator.registerFactory(() => BranchesBloc(
          serviceLocator(),
          serviceLocator(),
          serviceLocator(),
          serviceLocator(),
          serviceLocator(),
          serviceLocator(),
        ));
    serviceLocator.registerFactory(() => CustomerDetailsBloc(serviceLocator(),));

    /// USE CASES
    serviceLocator.registerLazySingleton(() => GetRangeUseCase(serviceLocator()));
    serviceLocator.registerLazySingleton(() => GetRegionUseCase(serviceLocator()));
    serviceLocator.registerLazySingleton(() => GetMainBranchesUseCase(serviceLocator()));
    serviceLocator.registerLazySingleton(() => SetNewBranchUseCase(serviceLocator()));
    serviceLocator.registerLazySingleton(() => AddRegionUseCase(serviceLocator()));
    serviceLocator.registerLazySingleton(() => GetAllCustomersUseCase(serviceLocator()));
    serviceLocator.registerLazySingleton(() => GetCustomerDetailsUseCase(serviceLocator()));

    /// REPOSITORY
    serviceLocator.registerLazySingleton<BaseRepository>(() => BranchesRepository(serviceLocator()));
    /// DATA SOURCE
    serviceLocator.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());
  }
}