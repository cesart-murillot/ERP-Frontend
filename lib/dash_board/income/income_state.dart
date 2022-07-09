import 'package:equatable/equatable.dart';

enum States {initial, loading, loaded, error}
class IncomeState extends Equatable {

  final String? errorMessage;
  final States state;

  IncomeState init() {
    return IncomeState();
  }

  IncomeState clone() {
    return IncomeState();
  }

  @override
  List<Object?> get props => [];

  IncomeState({this.errorMessage, this.state = States.initial});
}
