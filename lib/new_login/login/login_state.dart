import 'package:equatable/equatable.dart';

enum LoginStateView {loggingIn, loggedIn, initLogging, errorLogging}
class LoginState extends Equatable {
  final LoginStateView state;
  final String? error;
  LoginState init() {
    return const LoginState(state: LoginStateView.initLogging);
  }

  LoginState clone() {
    return const LoginState();
  }

  LoginState loggedIn() {
    return const LoginState(state: LoginStateView.loggedIn);
  }

  LoginState errorLogging({required String error}) {
    return LoginState(state: LoginStateView.errorLogging, error: error);
  }

  LoginState loggingIn() {
    return const LoginState(state: LoginStateView.loggingIn);
  }

  @override
  List<Object?> get props => [state, error];

  const LoginState({this.state = LoginStateView.initLogging, this.error});
}
