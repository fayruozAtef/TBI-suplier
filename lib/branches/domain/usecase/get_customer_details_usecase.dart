import 'package:branches/branches/data/models/customer_details_model.dart';
import 'package:branches/core/error/failure.dart';
import 'package:branches/core/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../repository/base_repository.dart';

class GetCustomerDetailsUseCase extends BaseUseCase<CustomerDetailsModel,GetCustomerDetailsParameters>{

  final BaseRepository baseRepository;


  GetCustomerDetailsUseCase(this.baseRepository);

  @override
  Future<Either<Failure, CustomerDetailsModel>> call(GetCustomerDetailsParameters parameters) {
    // TODO: implement call
    return baseRepository.getCustomerDetails(parameters);
  }

}

class GetCustomerDetailsParameters extends Equatable{
  final String customerId;
  final String userId;


  const GetCustomerDetailsParameters({
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