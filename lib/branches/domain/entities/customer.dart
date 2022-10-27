import 'package:equatable/equatable.dart';

class Customer extends Equatable{
  final String customerName;
  final int customerId;


  const Customer({
    required this.customerName,
    required this.customerId,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        customerName,
        customerId,
      ];
}