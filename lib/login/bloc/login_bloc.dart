import 'dart:async';

import 'package:erp_fronted/form_submission_status.dart';
import 'package:erp_fronted/login/bloc/login_event.dart';
import 'package:erp_fronted/login/bloc/login_state.dart';
import 'package:erp_fronted/src/resources/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  //final _repository = Repository();
  final Repository repository;
  LoginBloc({required this.repository}) : super(LoginState()) {
    on<LoginUsernameChanged>((event, emit) => emit(state.copyWith(username: event.username)));
    on<LoginPasswordChange>((event, emit) => emit(state.copyWith(password: event.password)));
    //on<LoginSubmitted>((event, emit) => emit(state.copyWith(formStatus: const FormSubmitting())));
    on<LoginSubmitted>(_onSubmitting);
  }

  FutureOr<void> _onSubmitting(LoginSubmitted event, Emitter<LoginState> emitter) async{
    emitter(state.copyWith(formStatus: const FormSubmitting()));

      try {
        await repository.fetchLogin();
        emitter(state.copyWith(formStatus: SubmissionSuccess()));
      } catch (e) {
        emitter(state.copyWith(formStatus: SubmissionFailed(e)));
      }
  }

  /*Stream<LoginState> mapEventToState(LoginEvent event) async* {
    /*if (event is LoginUsernameChanged) {
      yield state.copyWith(username: event.username);
    } else if (event is LoginPasswordChange) {
      yield state.copyWith(password: event.password);
    } else if (event is LoginSubmitted) {
      yield state.copyWith(formStatus: const FormSubmitting());

      try {
        await repository.fetchLogin();
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e));
      }
    }*/

  }*/
}
