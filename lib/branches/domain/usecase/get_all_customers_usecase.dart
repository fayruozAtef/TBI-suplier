import 'package:branches/branches/data/models/customer_model.dart';
import 'package:branches/core/error/failure.dart';
import 'package:branches/core/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../repository/base_repository.dart';

class GetAllCustomersUseCase extends BaseUseCase<List<CustomerModel>,String>{
  final BaseRepository baseRepository;

  GetAllCustomersUseCase(this.baseRepository);

  @override
  Future<Either<Failure, List<CustomerModel>>> call(String parameters) {
    // TODO: implement call
    return baseRepository.getAllCustomers(parameters);
  }

}