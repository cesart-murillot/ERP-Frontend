import 'package:erp_fronted/product/views/product_detail_page.dart';
import 'package:flutter/material.dart';

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
          key: key,
          home: Container(
            child: const ProductDetailPage(),
            margin: const EdgeInsets.only(left: 16.0, right: 16.0),
          ),
          theme: ThemeData(
              focusColor: Colors.red,
              scaffoldBackgroundColor: const Color(0xffe5ffff),
              textTheme: customTextTheme,
              primaryColor: const Color(0xffb2ebf2),
              backgroundColor: Colors.black,
              hintColor: Colors.black,
              inputDecorationTheme: customTheme),
        );
}

InputDecorationTheme customTheme = InputDecorationTheme(
  floatingLabelStyle: const TextStyle(
    color: Colors.black,
    fontSize: 16.0,
  ),
  labelStyle: const TextStyle(wordSpacing: 2.0, fontSize: 12.0),
  constraints: const BoxConstraints(
    minWidth: 180.0,
    maxWidth: 200.0,
    maxHeight: 32.0,
  ),
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
  contentPadding: const EdgeInsets.all(8.0),
);

TextTheme customTextTheme = const TextTheme(
  caption: TextStyle(wordSpacing: 4.0),
  overline: TextStyle(wordSpacing: 4.0),
);
