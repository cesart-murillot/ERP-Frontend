import 'package:erp_fronted/main/bloc/main_bloc.dart';
import 'package:erp_fronted/src/resources/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../product/views/product_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc(Repository())..add(GetEmployeeInfoEvent()),
      child: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          child: Column(
            children: const [
              EmployeeInfo(),
              EmployeeModules(),
            ],
          ),
        ),
        body: const Align(
          alignment: Alignment.center,
          child: EmployeeInfo(),
        ),
      ),
    );
  }
}

class EmployeeModules extends StatelessWidget {
  const EmployeeModules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(builder: (context, state) {
      if (state is LoadedInfoState) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state.modules.modules.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(
                IconData(
                  int.parse(state.modules.modules[index].iconModule!),
                  fontFamily: 'MaterialIcons',
                ),
              ),
              title: Text(state.modules.modules[index].nameModule),
              onTap: () {
                print(state.modules.modules[index].routeModule!);
                //Navigator.push(context, MaterialPageRoute(builder: (context) => ProductPage()));
                //Navigator.of(context).pushNamed(state.modules.modules[index].routeModule!);
                Navigator.pushNamed(context, state.modules.modules[index].routeModule!);
              },
            );
          },
        );
      }
      return const Text('noo');
    });
  }
}

class EmployeeInfo extends StatelessWidget {
  const EmployeeInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state is LoadedInfoState) {
          return DrawerHeader(
            child: Row(
              children: [
                const Align(child: FlutterLogo(), alignment: Alignment.topLeft),
                Column(
                  children: [
                    Align(
                      child: Text(state.employee.namesEmployee +
                          ' ' +
                          state.employee.lastNameEmployee),
                      alignment: Alignment.bottomLeft,
                    ),
                    Align(
                      child: Text(state.employee.user.email),
                      alignment: Alignment.bottomLeft,
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        return const Text('error');
      },
    );
  }
}
