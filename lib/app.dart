import 'package:erp_fronted/entry_order/list_entry_order/list_entry_order_view.dart';
import 'package:erp_fronted/inventory/views/entry/entry_page.dart';
import 'package:erp_fronted/inventory/views/entry/entry_register.dart';
import 'package:erp_fronted/inventory/views/inventory_page.dart';
import 'package:erp_fronted/login/views/login_page.dart';
import 'package:erp_fronted/main/views/main_page.dart';
import 'package:erp_fronted/product/views/product_create.dart';
import 'package:erp_fronted/product/views/product_detail_page.dart';
import 'package:erp_fronted/product_entry/product_entry_list/product_entry_list_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'inventory/views/entry/entry_verification.dart';

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
  App({Key? key})
      : super(
    debugShowCheckedModeBanner: false,
          key: key,
          home: ProductEntryListPage(),
          theme: ThemeData(
              scaffoldBackgroundColor: const Color(0xffe5ffff),
              textTheme: GoogleFonts.latoTextTheme(),
              primaryColor: const Color(0xffb2ebf2),
              backgroundColor: Colors.black,
              hintColor: Colors.black,
              //inputDecorationTheme: customTheme
          ),
        );
}

InputDecorationTheme customTheme = InputDecorationTheme(
/*  floatingLabelStyle: const TextStyle(
    color: Colors.black,
    fontSize: 16.0,
  ),*/
  //labelStyle: const TextStyle(wordSpacing: 2.0, fontSize: 12.0),
  //fillColor: const Color(0xffd0d8ff),
  /*filled: true,
  fillColor: const Color(0xffb6ffff),*/
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.0),
  ),
  disabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
  ),
  //contentPadding: const EdgeInsets.all(8.0),
);

TextTheme customTextTheme = const TextTheme(
  headline1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, ),
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
