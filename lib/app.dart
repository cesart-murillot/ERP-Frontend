import 'package:erp_fronted/product/views/product_page.dart';
import 'package:flutter/material.dart';

import 'login/views/login_page.dart';

class App extends MaterialApp {
  App({Key? key})
      : super(
          key: key,
          home: LoginPage(),
        );
}

/*class App extends MaterialApp {
  const App({Key? key}) : super(key: key, home: const ModulePage());
}*/
