import 'package:erp_fronted/new_login/login/login_state.dart';
import 'package:erp_fronted/new_main/main/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_bloc.dart';
import 'login_event.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginBloc()..add(const InitEvent()),
      child: Material(
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) async {
            switch (state.state) {
              case LoginStateView.loggingIn:
                break;
              case LoginStateView.loggedIn:
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MainPage(),
                  ),
                );
                break;
              case LoginStateView.initLogging:
                final prefs = await SharedPreferences.getInstance();
                final isLoggedIn = prefs.getBool('isLoggedIn');
                if (isLoggedIn != null) {
                  if (isLoggedIn) {
                    Navigator.pop(context);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const MainPage(),
                      ),
                    );
                  }
                }
                break;
              case LoginStateView.errorLogging:
                showModalBottomSheet(
                  backgroundColor: Colors.black,
                  context: context,
                  builder: (_) {
                    return Container(
                      height: 32.0,
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Ha ocurrido un error..., ${state.error}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                  isDismissible: true,
                );
                break;
            }
          },
          child: Login(),
        ),
      ),
    );
  }
}

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Center(
        child: Form(
          key: _formKey,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 512.0
            ),
            child: Card(
              margin: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 76.0,
                      child: TextFormField(
                        onSaved: (value) {
                          if (value != null) {
                            email.text = value;
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'Correo',
                          icon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    SizedBox(
                      height: 76.0,
                      child: TextFormField(
                        obscureText: true,
                        onSaved: (value) {
                          if (value != null) {
                            password.text = value;
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'Contraseña',
                          icon: Icon(Icons.password),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _formKey.currentState?.save();
                        context
                            .read<LoginBloc>()
                            .add(SubmitLogin(email.text, password.text));
                      },
                      child: const Text('Ingresar'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
