import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/employee/models/user_model.dart';
import 'package:erp_fronted/src/resources/generic_serializer.dart';
import 'package:erp_fronted/src/resources/get_object.dart';
import 'package:erp_fronted/src/resources/post_object.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState().init()) {
    on<InitEvent>(_init);
    on<SubmitLogin>(_submit);
  }

  void _init(InitEvent event, Emitter<LoginState> emit) async {
    emit(state.clone());
  }


  Future<FutureOr<void>> _submit(SubmitLogin event, Emitter<LoginState> emit) async {
    emit(const LoginState().loggingIn());
    var user = User((user) {
      user.email = event.email;
      user.password = event.password;
    });
    final url = preDefinedUri('/api/login/');
    final String? userString = objectToString(user, User.serializer);
    print(userString);
    if (userString != null) {
      try {
        final String response = await postDataToApi(url, userString);
        final deserialized = jsonDecode(response);

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', deserialized['token']);
        await prefs.setBool('isLoggedIn', true);
        await prefs.setInt('userId', deserialized['user_id']);

        emit(const LoginState().loggedIn());
      } catch (e) {
        emit(const LoginState().errorLogging(error: e.toString()));
        //print(e);
      }
    }
  }
}
