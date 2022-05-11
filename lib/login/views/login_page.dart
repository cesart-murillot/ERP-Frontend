import 'package:erp_fronted/form_submission_status.dart';
import 'package:erp_fronted/login/bloc/login_bloc.dart';
import 'package:erp_fronted/login/bloc/login_event.dart';
import 'package:erp_fronted/login/bloc/login_state.dart';
import 'package:erp_fronted/main/views/main_page.dart';
import 'package:erp_fronted/src/resources/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLoginPage extends StatelessWidget {
  const MainLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MainNavigation(),
      create: (context) => LoginBloc(
        repository: Repository(),
      ),
    );
  }
}

class MainNavigation extends StatelessWidget {
  final TextEditingController password = TextEditingController();
  final TextEditingController username = TextEditingController();

  MainNavigation({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Navigator(
        pages: [
          MaterialPage(
            child: Scaffold(
              body: _loginForm(),
            ),
          ),
          if (state.formStatus is SubmissionSuccess)
            const MaterialPage(
              child: MainPage(),
            ),
        ],
        onPopPage: (route, result) {
          //context.read<BranchBloc>().add(FetchBranchesEvent());
          return route.didPop(result);
        },
      );
    });
  }

  Widget _loginForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _usernameField(),
            _passwordField(),
            _loginButton(),
          ],
        ),
      ),
    );
  }

  Widget _passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          controller: password,
          obscureText: true,
          decoration: const InputDecoration(
            icon: Icon(Icons.security),
            hintText: 'Contraseña',
          ),
          validator: (value) =>
              state.isValidPassword ? null : 'Contraseña incorrecta',
          onChanged: (value) => context
              .read<LoginBloc>()
              .add(LoginPasswordChange(password: value)),
        );
      },
    );
  }

  Widget _usernameField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          controller: username,
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            hintText: 'Usuario',
          ),
          validator: (value) => state.isValidUsername
              ? null
              : 'El nombre se usuario es muy corto',
          onChanged: (value) => context
              .read<LoginBloc>()
              .add(LoginUsernameChanged(username: value)),
        );
      },
    );
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? const CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  context.read<LoginBloc>().add(LoginSubmitted(
                      username: username.text, password: password.text));
                }
              },
              child: const Text('Ingresar'),
            );
    });
  }
}

/*class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Scaffold(
        body: _loginForm(),
      );
    });
  }

  Widget _loginForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _usernameField(),
            _passwordField(),
            _loginButton(),
          ],
        ),
      ),
    );
  }

  Widget _passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          controller: password,
          obscureText: true,
          decoration: const InputDecoration(
            icon: Icon(Icons.security),
            hintText: 'Contraseña',
          ),
          validator: (value) =>
              state.isValidPassword ? null : 'Contraseña incorrecta',
          onChanged: (value) => context
              .read<LoginBloc>()
              .add(LoginPasswordChange(password: value)),
        );
      },
    );
  }

  Widget _usernameField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          controller: username,
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            hintText: 'Usuario',
          ),
          validator: (value) => state.isValidUsername
              ? null
              : 'El nombre se usuario es muy corto',
          onChanged: (value) => context
              .read<LoginBloc>()
              .add(LoginUsernameChanged(username: value)),
        );
      },
    );
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? const CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  context.read<LoginBloc>().add(LoginSubmitted(
                      username: username.text, password: password.text));
                }
              },
              child: const Text('Ingresar'),
            );
    });
  }
}*/
