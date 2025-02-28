import 'package:equatable/equatable.dart';

sealed class EvaluateFormulaState extends Equatable {}

final class SuccessEvaluate extends EvaluateFormulaState {
  final String value;

  SuccessEvaluate(this.value);

  @override
  List<Object?> get props => [value];
}

final class FailedEvaluate extends EvaluateFormulaState {
  final String message;

  FailedEvaluate(this.message);

  @override
  List<Object?> get props => [message];
}

final class OtherState extends EvaluateFormulaState {
  final String statusCode;
  final String message;

  OtherState(this.statusCode, this.message);

  @override
  List<Object?> get props => [statusCode, message];
}
