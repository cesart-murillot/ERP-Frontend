import 'package:erp_fronted/dash_board/dash_board/dash_board_view.dart';
import 'package:erp_fronted/employee/list_employee/list_employee_view.dart';
import 'package:erp_fronted/employee/show_employee/show_employee_view.dart';
import 'package:erp_fronted/new_login/login/login_view.dart';
import 'package:erp_fronted/new_main/main/main_state.dart';
import 'package:erp_fronted/new_product/product_list/product_list_view.dart';
import 'package:erp_fronted/warehouse/warehouse_list/warehouse_list_view.dart';
import 'package:erp_fronted/warehouse/warehouse_menu/warehouse_menu_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_bloc.dart';
import 'main_event.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MainBloc()..add(const InitEvent()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(),
            drawer: Drawer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListView(
                    shrinkWrap: true,
                    children: [
                      DrawerHeader(
                        child: Column(
                          //mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const FlutterLogo(size: 64.0),
                            const SizedBox(
                              height: 8.0,
                            ),
                            TextButton(
                              onPressed: () {
                                final int employeeId = BlocProvider.of<MainBloc>(context).state.user!.employee!.id!;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        ShowEmployeePage(employeeID: employeeId),
                                  ),
                                );
                              },
                              child: Text(
                                '${context.watch<MainBloc>().state.user?.employee?.namesEmployee} ${context.watch<MainBloc>().state.user?.employee?.lastNameEmployee}',
                              ),
                            ),

                            Text(
                              '${context.watch<MainBloc>().state.user?.email}',
                            ),

                            Text(
                              '${context.watch<MainBloc>().state.user?.role?.nameRole}',
                            )
                          ],
                        ),
                        decoration:
                            const BoxDecoration(color: Colors.white30),
                      ),
                      const ModuleList(),
                    ],
                  ),
                  Wrap(
                    children: [
                      const Divider(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () {
                            showDialog(
                              useSafeArea: true,
                              context: context,
                              builder: (_) => BlocProvider.value(
                                value: BlocProvider.of<MainBloc>(context),
                                child: const VerificationDialog(),
                              ),
                            );
                          },
                          child: const Text('Cerrar Sesión'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            body: const BodyPage(),
          );
        },
      ),
    );
  }
}

class ModuleList extends StatelessWidget {
  const ModuleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state.state == MainViewState.loadedInfo) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.user!.role!.modules!.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(
                  IconData(
                    int.parse(state.user?.role?.modules?[index].iconModule ??
                        '0xf0555'),
                    fontFamily: 'MaterialIcons',
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  context.read<MainBloc>().add(ShowPageEvent(
                      state.user?.role?.modules?[index].routeModule ??
                          'homepage',
                      state.user!));
                },
                title: state.user?.role == null
                    ? const Text('no data')
                    : Text(state.user!.role!.modules![index].nameModule),
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class BodyPage extends StatelessWidget {
  const BodyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        switch (state.page) {
          /*case AppPage.product:
            return const ProductListPage();
          case AppPage.inventory:
            return const ProductInventoryPage();
          case AppPage.billing:
            return const TransferOrderListPage();
          case AppPage.employee:
            return const ListEmployeePage();
          case AppPage.branch:
            return const Text('branch');
          case AppPage.homepage:
            return const DashBoardPage();
          case AppPage.entry:
            return const IndexEntryOrderPage();
          case AppPage.productEntry:
            return const IndexProductEntryPage();
          case AppPage.productRequest:
            return const ListProductRequestPage();*/
          case AppPage.dashboard:
            return const DashBoardPage();
          case AppPage.users:
            return const ListEmployeePage();
          case AppPage.products:
            return const ProductListPage();
          case AppPage.inventory:
            return const Center(
              child: Text(
                'Inventarios',
              ),
            );
          case AppPage.warehouses:
            return const WarehouseMenuPage();
          case AppPage.quotations:
            return const Center(
              child: Text(
                'Cotizaciones',
              ),
            );
          case AppPage.sales:
            return const Center(
              child: Text(
                'Ventas',
              ),
            );
          case AppPage.invoices:
            return const Center(
              child: Text(
                'Facturas',
              ),
            );
        }
      },
    );
  }
}

class VerificationDialog extends StatelessWidget {
  const VerificationDialog({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return AlertDialog(
          title: const Text('¿Cerrar Sesión?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                context.read<MainBloc>().add(const CloseSessionEvent());
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LoginPage(),
                  ),
                );
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
