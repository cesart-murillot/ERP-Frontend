import 'package:erp_fronted/dash_board/dash_board/dash_board_view.dart';
import 'package:erp_fronted/employee/list_employee/list_employee_view.dart';
import 'package:erp_fronted/entry_order/list_entry_order/list_entry_order_view.dart';
import 'package:erp_fronted/new_main/main/main_state.dart';
import 'package:erp_fronted/new_product/product_list/product_list_view.dart';
import 'package:erp_fronted/product/views/product_page.dart';
import 'package:erp_fronted/product_entry/product_entry_list/product_entry_list_view.dart';
import 'package:erp_fronted/product_request/list_product_request/list_product_request_view.dart';
import 'package:erp_fronted/product_request/request_product/request_product_view.dart';
import 'package:erp_fronted/transfer_order/transfer_order_list/transfer_order_list_view.dart';
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
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Column(
                      //mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FlutterLogo(size: 64.0),
                        Text('${context.watch<MainBloc>().state.user?.employee?.namesEmployee} ${context.watch<MainBloc>().state.user?.employee?.lastNameEmployee}'),
                        Text('${context.watch<MainBloc>().state.user?.email}'),
                        Text('${context.watch<MainBloc>().state.user?.role?.nameRole}')
                      ],
                    ),
                    decoration: const BoxDecoration(color: Colors.white30),
                  ),
                  const ModuleList(),
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
          case AppPage.product:
            return const ProductListPage();
          case AppPage.inventory:
            return const Text('inventory');
          case AppPage.billing:
            return const TransferOrderListPage();
          case AppPage.employee:
            return const ListEmployeePage();
          case AppPage.branch:
            return const Text('branch');
          case AppPage.homepage:
            return const DashBoardPage();
          case AppPage.entry:
            return const ListEntryOrderPage();
          case AppPage.productEntry:
            return const ProductEntryListPage();
          case AppPage.productRequest:
            return const ListProductRequestPage();
        }
      },
    );
  }
}
