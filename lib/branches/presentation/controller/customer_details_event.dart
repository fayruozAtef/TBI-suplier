part of 'customer_details_bloc.dart';

abstract class CustomerDetailsEvent extends Equatable {
  const CustomerDetailsEvent();
}
class GetCustomerDetailsEvent extends CustomerDetailsEvent{
  final String customerId;
  final String userId;

  const GetCustomerDetailsEvent({
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
