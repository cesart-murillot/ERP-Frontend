import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/branch/models/branch_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'warehouse_list_event.dart';
import 'warehouse_list_state.dart';

class WarehouseListBloc extends Bloc<WarehouseListEvent, WarehouseListState> {
  WarehouseListBloc() : super(const WarehouseListState().init()) {
    on<InitEvent>(_init);
    on<ShowBranchEvent>(_showBranch);
  }

  void _init(InitEvent event, Emitter<WarehouseListState> emit) async {
    emit(state.loadedData(state: States.loading, isAdmin: false));
    final prefs = await SharedPreferences.getInstance();
    final roleId = prefs.getInt('roleId');
    final branchId = prefs.getInt('branchId');

    if (roleId == 1 || roleId == 2) {
      final urlBranches = preDefinedUri('/api/branches/');
      try {
        final Branches branches = await getObject(urlBranches, Branches.serializer);
        return emit(state.loadedData(state: States.loaded, isAdmin: true, branches: branches));
      } catch (e) {
        return emit(state.error(errorMessage: e.toString()));
      }
    }

    final urlBranch = preDefinedUri('/api/branches/$branchId/');
    try {
      final Branch branch = await getObject(urlBranch, Branch.serializer);
      return emit(state.loadedData(state: States.loaded, isAdmin: false, branch: branch));
    } catch (e) {
      return emit(state.error(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _showBranch(ShowBranchEvent event, Emitter<WarehouseListState> emit) async {
    final urlBranch = preDefinedUri('/api/branches/${event.branchId}/');
    try {
      final Branch branch = await getObject(urlBranch, Branch.serializer);
      emit(state.loadedData(state: States.loaded, isAdmin: true, branch: branch));
    } catch (e) {
      return emit(state.error(errorMessage: e.toString()));
    }
  }
}
