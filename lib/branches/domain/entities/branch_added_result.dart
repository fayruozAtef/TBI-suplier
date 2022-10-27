import 'package:equatable/equatable.dart';

class BranchAddedResult extends Equatable{
  final int state;
  final String message;

  const BranchAddedResult({
    required this.state,
    required this.message,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        state,
        message,
      ];
}