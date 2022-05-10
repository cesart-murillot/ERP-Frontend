import 'package:erp_fronted/branch/bloc/branch_bloc.dart';
import 'package:erp_fronted/branch/models/branch_model.dart';
import 'package:erp_fronted/branch/views/branch_create_page.dart';
import 'package:erp_fronted/branch/views/branch_list_page.dart';
import 'package:erp_fronted/product/views/product_page.dart';
import 'package:erp_fronted/src/resources/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login/views/login_page.dart';

class App extends MaterialApp {
  App({Key? key})
      : super(
          key: key,
          home: BlocProvider(create: (_) => BranchBloc(Repository()),
          child: const BranchList()),
        );
}

/*class App extends MaterialApp {
  const App({Key? key}) : super(key: key, home: const ModulePage());
}*/
