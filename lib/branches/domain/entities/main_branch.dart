import 'package:equatable/equatable.dart';

class MainBranch extends Equatable{
  final String customerId;
  final String companyName;

  const MainBranch({
    required this.customerId,
    required this.companyName,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [customerId,companyName];

}