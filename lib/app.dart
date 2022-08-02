import 'package:erp_fronted/employee/add_employee/add_employee_view.dart';
import 'package:erp_fronted/employee/list_employee/list_employee_view.dart';
import 'package:erp_fronted/entry_order/list_entry_order/list_entry_order_view.dart';
import 'package:erp_fronted/new_login/login/login_view.dart';
import 'package:erp_fronted/try/try/try_view.dart';
import 'package:erp_fronted/try/try_hard/try_hard_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
/*
class App extends MaterialApp {
  const App({Key? key})
      : super(
          key: key,
          home: const MainLoginPage(),
    */
/*home: BlocProvider(create: (_) => BranchBloc(Repository()),
          child: const BranchList()),*/ /*

        );

}
*/

/*class AppPro extends StatelessWidget {
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
}*/
class App extends MaterialApp {
  const App({Key? key})
      : super(
          debugShowCheckedModeBanner: false,
          key: key,
          home: const LoginPage(),
        );
}

InputDecorationTheme customTheme = InputDecorationTheme(
  isCollapsed: true,
  floatingLabelStyle: const TextStyle(
    color: Colors.black,
    fontSize: 24.0,
  ),
  labelStyle: const TextStyle(wordSpacing: 2.0, fontSize: 12.0),
  filled: true,
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.0),
  ),
  disabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
  ),
  contentPadding: const EdgeInsets.all(8.0),
);

TextTheme customTextTheme = const TextTheme(
  headline1: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  ),
  headline2: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
  headline3: TextStyle(fontSize: 32.0, fontWeight: FontWeight.normal),
  headline4: TextStyle(fontSize: 32.0, fontWeight: FontWeight.normal),
  headline5: TextStyle(fontSize: 32.0, fontWeight: FontWeight.normal),
  headline6: TextStyle(fontSize: 32.0, fontWeight: FontWeight.normal),

/*  headlineLarge: TextStyle(fontSize: 8.0, fontWeight: FontWeight.normal),
  headlineMedium: TextStyle(fontSize: 8.0, fontWeight: FontWeight.normal),
  headlineSmall: TextStyle(fontSize: 8.0, fontWeight: FontWeight.normal),*/

  /* labelLarge: TextStyle(fontSize: 8.0, fontWeight: FontWeight.normal),
  labelMedium: TextStyle(fontSize: 8.0, fontWeight: FontWeight.normal),
  labelSmall: TextStyle(fontSize: 8.0, fontWeight: FontWeight.normal),

  bodyLarge: TextStyle(fontSize: 8.0, fontWeight: FontWeight.normal),
  bodyMedium: TextStyle(fontSize: 8.0, fontWeight: FontWeight.normal),
  bodySmall: TextStyle(fontSize: 8.0, fontWeight: FontWeight.normal),

  bodyText1: TextStyle(fontSize: 8.0, fontWeight: FontWeight.normal),
  bodyText2: TextStyle(fontSize: 8.0, fontWeight: FontWeight.normal),

  titleLarge: TextStyle(fontSize: 8.0, fontWeight: FontWeight.normal),
  titleMedium: TextStyle(fontSize: 8.0, fontWeight: FontWeight.normal),
  titleSmall: TextStyle(fontSize: 8.0, fontWeight: FontWeight.normal),

  displayLarge: TextStyle(fontSize: 8.0, fontWeight: FontWeight.normal),
  displayMedium: TextStyle(fontSize: 8.0, fontWeight: FontWeight.normal),
  displaySmall: TextStyle(fontSize: 8.0, fontWeight: FontWeight.normal),

  subtitle1: TextStyle(fontSize: 8.0, fontWeight: FontWeight.normal),
  subtitle2: TextStyle(fontSize: 8.0, fontWeight: FontWeight.normal),*/
);
