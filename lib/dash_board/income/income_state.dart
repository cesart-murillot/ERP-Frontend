import 'package:equatable/equatable.dart';

enum States {initial, loading, loaded, error}
class IncomeState extends Equatable {

  final String? errorMessage;
  final States state;

  IncomeState init() {
    return const IncomeState();
  }

  IncomeState clone() {
    return const IncomeState();
  }

  @override
  List<Object?> get props => [];

  const IncomeState({this.errorMessage, this.state = States.initial});
}
