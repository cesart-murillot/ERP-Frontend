import 'dart:async';
import 'dart:convert';

import 'package:erp_fronted/employee/models/user_model.dart';
import 'package:erp_fronted/form_submission_status.dart';
import 'package:erp_fronted/login/bloc/login_event.dart';
import 'package:erp_fronted/login/bloc/login_state.dart';
import 'package:erp_fronted/src/models/serializers.dart';
import 'package:erp_fronted/src/resources/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  //final _repository = Repository();
  final Repository repository;

  LoginBloc({required this.repository}) : super(LoginState()) {
    on<LoginUsernameChanged>(
        (event, emit) => emit(state.copyWith(username: event.username)));
    on<LoginPasswordChange>(
        (event, emit) => emit(state.copyWith(password: event.password)));
    //on<LoginSubmitted>((event, emit) => emit(state.copyWith(formStatus: const FormSubmitting())));
    on<LoginSubmitted>(_onSubmitting);
  }

  FutureOr<void> _onSubmitting(
      LoginSubmitted event, Emitter<LoginState> emitter) async {
    emitter(state.copyWith(
        formStatus: FormSubmitting(),
        username: event.username,
        password: event.password));

    var user = User((b) => b
      ..email = event.username
      ..password = event.password);
    
    Object? userSerialized = standardSerializers.serializeWith(User.serializer, user);
    try {
      String response = await repository.attemptLogin(jsonEncode(userSerialized));
      print(response);
      emitter(state.copyWith(formStatus: SubmissionSuccess(response)));
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
