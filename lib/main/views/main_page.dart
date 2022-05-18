import 'package:erp_fronted/inventory/views/entry/entry_verification.dart';
import 'package:erp_fronted/main/app_bar/bloc/app_bar_bloc.dart';
import 'package:erp_fronted/main/bloc/main_bloc.dart';
import 'package:erp_fronted/main/bloc/main_cubit.dart';
import 'package:erp_fronted/main/navigator/bloc/navigator_bloc.dart'
    as nav_bloc;
import 'package:erp_fronted/product/bloc/product_bloc.dart';
import 'package:erp_fronted/product/views/product_create.dart';
import 'package:erp_fronted/product/views/product_detail_page.dart';
import 'package:erp_fronted/src/resources/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_bar/widgets/app_bar.dart';

class MainNavigator extends StatelessWidget {
  const MainNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MainBloc(Repository())
            ..add(
              GetEmployeeInfoEvent(),
            ),
        ),
        BlocProvider(
          create: (_) => MainCubit(),
        ),
        BlocProvider(
          create: (_) => AppBarBloc()
            ..add(
              AppBarEventMain(),
            ),
        ),
        BlocProvider(
          create: (_) => ProductSearchBarBloc(
            Repository(),
          ),
        ),
        BlocProvider(
          create: (_) => nav_bloc.NavigatorBloc(),
        ),
      ],
/*      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return Navigator(
            pages: const [
              MaterialPage(
                child: MainPage(),
              ),
            ],
            onPopPage: (route, result) {
              //context.read<NavigatorBloc>().add(NavigatorEventInitial());
              //context.read<MainBloc>().add(GetEmployeeInfoEvent());
              //context.read<ProductBloc>().add(ProductEventGetProductList());
              return route.didPop(result);
            },
          );
        },
      ),*/
      child: BlocBuilder<nav_bloc.NavigatorBloc, nav_bloc.NavigatorState>(
        builder: (context, state) {
          return Navigator(
            pages: [
              const MaterialPage(
                child: MainPage(),
              ),
              if (state is nav_bloc.NavigatorStateProductCreate)
                MaterialPage(
                  child: ProductCreatePage(),
                ),
              if (state is nav_bloc.NavigatorStateProductDetail)
                MaterialPage(
                  child: ProductDetailPage(product: state.product),
                ),
              if (state is nav_bloc.NavigatorStateEntryVerification)
                MaterialPage(
                  child: EntryVerification(
                    entry: state.entry,
                  ),
                )
            ],
            onPopPage: (route, result) {
              context
                  .read<nav_bloc.NavigatorBloc>()
                  .add(nav_bloc.NavigatorEventInitial());
              return route.didPop(result);
            },
          );
        },
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      drawer: Drawer(
        child: Column(
          children: const [
            EmployeeInfo(),
            EmployeeModules(),
          ],
        ),
      ),
      body: const ModulePage(),
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
                /*BlocProvider.of<MainCubit>(context)
                    .productPage(state.modules.modules[index].routeModule!);*/
                context
                    .read<MainCubit>()
                    .switchPage(state.modules.modules[index].routeModule!);

                context.read<AppBarBloc>().add(AppBarEventGeneric(
                    state.modules.modules[index].routeModule!));
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

class ModulePage extends StatelessWidget {
  const ModulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, Widget>(builder: (context, state) => state);
  }
}

class PageTitle extends StatelessWidget {
  const PageTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TitleCubit, Widget>(builder: (context, state) => state);
  }
}

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({Key? key}) : super(key: key);
  static final _appBar = AppBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarBloc, AppBarState>(
      builder: (context, state) {
        if (state is AppBarStateInitial) {
          return const MainAppBar();
        }
        if (state is AppBarStateProduct) {
          return const ProductAppBar();
        }
        if (state is AppBarStateBilling) {
          return const BillingAppBar();
        }
        if (state is AppBarStateBranch) {
          return const BranchAppBar();
        }
        if (state is AppBarStateEmployee) {
          return const EmployeeAppBar();
        }
        if (state is AppBarStateInventory) {
          return const InventoryAppBar();
        }
        return AppBar();
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_appBar.preferredSize.height);
}
