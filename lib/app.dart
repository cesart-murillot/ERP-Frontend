import 'package:erp_fronted/branch/models/branch_model.dart';
import 'package:erp_fronted/branch/views/branch_create_page.dart';
import 'package:erp_fronted/product/views/product_page.dart';
import 'package:flutter/material.dart';

import 'login/views/login_page.dart';

class App extends MaterialApp {
  App({Key? key})
      : super(
          key: key,
          home: ListBranch(),
        );
}

/*class App extends MaterialApp {
  const App({Key? key}) : super(key: key, home: const ModulePage());
}*/
