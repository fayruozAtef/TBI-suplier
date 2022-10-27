part of 'customer_details_bloc.dart';

class CustomerDetailsState extends Equatable {
  final CustomerDetailsModel customerData;
  final RequestState getCustomerDetailsState;
  final String getCustomerDetailsMessage;


  const CustomerDetailsState({
    this.customerData=const CustomerDetailsModel(companyName: '', regionName: '', telephon1: '', telephon2: '', addressUrl: '', address: '', email: '', customerId: '',),
    this.getCustomerDetailsState= RequestState.loading,
    this.getCustomerDetailsMessage='',
  });

  CustomerDetailsState copyWith({
    CustomerDetailsModel? customerData,
    RequestState? getCustomerDetailsState,
    String? getCustomerDetailsMessage,
  })=>CustomerDetailsState(
    customerData: customerData ?? this.customerData,
    getCustomerDetailsState: getCustomerDetailsState ?? this.getCustomerDetailsState,
    getCustomerDetailsMessage: getCustomerDetailsMessage ?? this.getCustomerDetailsMessage,
  );
  @override
  // TODO: implement props
  List<Object?> get props => [
        customerData,
        getCustomerDetailsMessage,
        getCustomerDetailsState,
      ];
}


