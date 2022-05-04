import 'package:erp_fronted/module/views/module_page.dart';
import 'package:erp_fronted/src/resources/repository.dart';
import 'package:flutter/material.dart';
import 'package:erp_fronted/login/views/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends MaterialApp {
  App({Key? key})
      : super(
            key: key,
            home: ModulePage());
}

/*class App extends MaterialApp {
  const App({Key? key}) : super(key: key, home: const ModulePage());
}*/
