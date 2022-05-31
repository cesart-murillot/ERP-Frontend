import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class InitEvent extends LoginEvent {
  const InitEvent();

  @override
  List<Object?> get props => [];
}

class SubmitLogin extends LoginEvent {
  final String email, password;
  @override
  List<Object?> get props => [email, password];

  const SubmitLogin(this.email, this.password);
}