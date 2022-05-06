abstract class LoginEvent{}

class LoginUsernameChanged extends LoginEvent {
  final String username;

  LoginUsernameChanged({required this.username});
}

class LoginPasswordChange extends LoginEvent {
  final String password;

  LoginPasswordChange({required this.password});
}

class LoginSubmitted extends LoginEvent {
  final String? username;
  final String? password;

  LoginSubmitted({required this.username, required this.password});
}