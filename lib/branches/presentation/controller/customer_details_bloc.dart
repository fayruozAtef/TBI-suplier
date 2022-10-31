import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:branches/branches/data/models/customer_details_model.dart';
import 'package:branches/branches/domain/usecase/get_customer_details_usecase.dart';
import 'package:branches/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

part 'customer_details_event.dart';
part 'customer_details_state.dart';

class CustomerDetailsBloc extends Bloc<CustomerDetailsEvent, CustomerDetailsState> {
  CustomerDetailsBloc(this.getCustomerDetailsUseCase) : super(const CustomerDetailsState()) {
    on<GetCustomerDetailsEvent>(_getCustomerData);
  }

  final GetCustomerDetailsUseCase getCustomerDetailsUseCase;

  FutureOr<void> _getCustomerData(GetCustomerDetailsEvent event, Emitter<CustomerDetailsState> emit) async{
    final result = await getCustomerDetailsUseCase(GetCustomerDetailsParameters(
      customerId: event.customerId,
      userId: event.userId,
    ));
    result.fold((l) {
      emit(
          state.copyWith(
            getCustomerDetailsState: RequestState.error,
            getCustomerDetailsMessage: l.message,
          ));
    }, (r) {
      emit(
          state.copyWith(
            customerData: r,
            getCustomerDetailsState: RequestState.loaded,
          ));
    });
  }
  
}
