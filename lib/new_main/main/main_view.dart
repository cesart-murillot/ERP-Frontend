import 'package:erp_fronted/dash_board/dash_board/dash_board_view.dart';
import 'package:erp_fronted/employee/list_employee/list_employee_view.dart';
import 'package:erp_fronted/employee/show_employee/show_employee_view.dart';
import 'package:erp_fronted/invoice/invoice_list/invoice_list_view.dart';
import 'package:erp_fronted/new_login/login/login_view.dart';
import 'package:erp_fronted/new_main/main/main_state.dart';
import 'package:erp_fronted/new_product/product_list/product_list_view.dart';
import 'package:erp_fronted/quotation/list_quotation/list_quotation_view.dart';
import 'package:erp_fronted/sale/list_sale/list_sale_view.dart';
import 'package:erp_fronted/warehouse/warehouse_menu/warehouse_menu_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../inventory/menu_inventory/menu_inventory_view.dart';
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
          return
          Scaffold(
            appBar: AppBar(),
            drawer: Drawer(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListView(
                      shrinkWrap: true,
                      children: [
                        SizedBox(
                          height: 232.0,
                          child: DrawerHeader(
                            decoration:
                                const BoxDecoration(color: Colors.white30),
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
                                    final int employeeId =
                                        BlocProvider.of<MainBloc>(context)
                                            .state
                                            .user!
                                            .employee!
                                            .id!;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ShowEmployeePage(
                                            employeeID: employeeId),
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
                                ),
                                Text(
                                  '${context.watch<MainBloc>().state.user?.employee?.branch?.typeBranch} - ${context.watch<MainBloc>().state.user?.employee?.branch?.nameBranch}',
                                ),
                              ],
                            ),
                          ),
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
            physics: const NeverScrollableScrollPhysics(),
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
          case AppPage.dashboard:
            return const DashBoardPage();
          case AppPage.users:
            return const ListEmployeePage();
          case AppPage.products:
            return const ProductListPage();
          case AppPage.inventory:
            return const MenuInventoryPage();
          case AppPage.warehouses:
            return const WarehouseMenuPage();
          case AppPage.quotations:
            return const ListQuotationPage();
          case AppPage.sales:
            return const ListSalePage();
          case AppPage.invoices:
            return const InvoiceListPage();
          case AppPage.home:
            return const DashBoardPage();
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

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  bool menuBarVisibility = false;
  bool menuVisibility = true;
  static const double maxWidth = 1024;
  static const double reorderWidth = 640;

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);

    return MediaQuery(
      data: data,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: maxWidth,
          ),
          child: Row(
            children: [
              if (menuVisibility && data.size.width > reorderWidth)
                Flexible(
                  flex: 2,
                  child: Column(),
                ),
              const Flexible(
                child: BodyPage(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
