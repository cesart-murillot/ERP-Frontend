import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/employee/models/user_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState().init()) {
    on<InitEvent>(_init);
    on<TryEvent>(_try);
    on<ShowPageEvent>(_showPage);
    on<CloseSessionEvent>(_closeSession);
  }

  void _init(InitEvent event, Emitter<MainState> emit) async {

    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('userId');

    final url = preDefinedUri('/api/users/'+ userId.toString(), {'with': 'all'});
    final User user = await getObject(url, User.serializer);

    await prefs.setInt('branchId', user.employee!.branchID!);
    await prefs.setInt('roleId', user.roleId!);
    emit(const MainState().loadedInfo(user: user));
  }

  Future<FutureOr<void>> _try(TryEvent event, Emitter<MainState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn');
    final userId = prefs.getInt('userId');

  }

  FutureOr<void> _showPage(ShowPageEvent event, Emitter<MainState> emit) {
    switch (event.routePage) {
      case 'dashboard':
        emit(state.currentPage(page: AppPage.dashboard, user: event.user));
        break;
      case 'users':
        emit(state.currentPage(page: AppPage.users, user: event.user));
        break;
      case 'products':
        emit(state.currentPage(page: AppPage.products, user: event.user));
        break;
      case 'inventory':
        emit(state.currentPage(page: AppPage.inventory, user: event.user));
        break;
      case 'warehouses':
        emit(state.currentPage(page: AppPage.warehouses, user: event.user));
        break;
      case 'quotations':
        emit(state.currentPage(page: AppPage.quotations, user: event.user));
        break;
      case 'sales':
        emit(state.currentPage(page: AppPage.sales, user: event.user));
        break;
      case 'invoices':
        emit(state.currentPage(page: AppPage.invoices, user: event.user));
        break;

      /*case 'product':
        emit(const MainState().currentPage(page: AppPage.product, user: event.user));
        break;
      case 'inventory':
        emit(const MainState().currentPage(page: AppPage.inventory, user: event.user));
        break;
      case 'employee':
        emit(const MainState().currentPage(page: AppPage.employee, user: event.user));
        break;
      case 'homepage':
        emit(const MainState().currentPage(page: AppPage.homepage, user: event.user));
        break;
      case 'entry':
        emit(const MainState().currentPage(page: AppPage.entry, user: event.user));
        break;
      case 'product_entry':
        emit(const MainState().currentPage(page: AppPage.productEntry, user: event.user));
        break;
      case 'product_request':
        emit(const MainState().currentPage(page: AppPage.productRequest, user: event.user));
        break;
      case 'billing':
        emit(const MainState().currentPage(page: AppPage.billing, user: event.user));
        break;
      default:
        emit(const MainState().currentPage(page: AppPage.homepage, user: event.user));
        break;*/
    }
  }

  Future<FutureOr<void>> _closeSession(CloseSessionEvent event, Emitter<MainState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
