import 'package:equatable/equatable.dart';

class Range extends Equatable{
  final String rangeName;
  final int rangeId;


  const Range({
    required this.rangeName,
    required this.rangeId,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        rangeName,
        rangeId,
      ];
}