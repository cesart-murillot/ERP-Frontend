import 'package:erp_fronted/product/views/product_page.dart';
import 'package:flutter/material.dart';

import 'login/views/login_page.dart';

/*
class App extends MaterialApp {
  const App({Key? key})
      : super(
          key: key,
          home: const MainLoginPage(),
    */
/*home: BlocProvider(create: (_) => BranchBloc(Repository()),
          child: const BranchList()),*//*

        );

}
*/

class AppPro extends StatelessWidget {
  const AppPro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: '/',
      onGenerateRoute: generateRoute,
    );
  }
}

Route<dynamic>? generateRoute(RouteSettings settings) {
  final args = settings.arguments;

  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => const MainLoginPage());
    case 'product':
      return MaterialPageRoute(builder: (_) => const ProductPage());
    default:
      return MaterialPageRoute(builder: (_) => const MainLoginPage());
  }
}


/*class App extends MaterialApp {
  const App({Key? key}) : super(key: key, home: const ModulePage());
}*/
