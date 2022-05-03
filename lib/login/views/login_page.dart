import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loginForm(),
    );
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
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        icon: Icon(Icons.security),
        hintText: 'Contraseña',
      ),
      validator: (value) => null,
    );
  }

  Widget _usernameField() {
    return TextFormField(
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'Usuario',
      ),
      validator: (value) => null,
    );
  }

  Widget _loginButton() {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Ingresar'),
    );
  }
}
