import 'package:erp_fronted/form_submission_status.dart';
import 'package:erp_fronted/login/bloc/login_event.dart';
import 'package:erp_fronted/login/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState());

  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginUsernameChanged) {
      yield state.copyWith(username: event.username);
    } else if (event is LoginPasswordChange) {
      yield state.copyWith(password: event.password);
    } else if (event is LoginSubmitted) {
      yield state.copyWith(formStatus: const FormSubmitting());
    }
  }
}
