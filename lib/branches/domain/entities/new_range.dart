import 'package:equatable/equatable.dart';

class NewRange extends Equatable{
  final String userId;
  final String rangeName;

  const NewRange(
    this.userId,
    this.rangeName,
  );

  @override
  // TODO: implement props
  List<Object?> get props => [
        userId,
        rangeName,
      ];
}