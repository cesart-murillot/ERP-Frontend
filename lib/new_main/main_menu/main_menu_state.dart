import 'package:equatable/equatable.dart';
import 'package:erp_fronted/employee/models/user_model.dart';

enum States { loaded, loading, initial, error }

class MainMenuState extends Equatable {
  final States state;
  final String errorMessage;
  final User? user;

  MainMenuState init() {
    return const MainMenuState();
  }

  MainMenuState clone({required States state, User? user}) {
    return MainMenuState(
      state: state,
      user: user ?? this.user,
    );
  }

  MainMenuState error({required String errorMessage}) {
    return MainMenuState(
      state: States.error,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [state, errorMessage, user,];

  const MainMenuState({
    this.state = States.initial,
    this.errorMessage = '',
    this.user,
  });
}
