import 'package:bloc/bloc.dart';
import 'package:erp_fronted/branch/models/branch_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';
import 'package:flutter/material.dart';

import 'warehouse_drop_down_state.dart';

class WarehouseDropDownCubit extends Cubit<WarehouseDropDownState> {
  WarehouseDropDownCubit() : super(const WarehouseDropDownState().init());

  Future<void> getWarehouse() async {
    final url = preDefinedUri('/api/branches/1');
    final Branch branch = await getObject(url, Branch.serializer);

    List<DropdownMenuItem<int>> warehouseList = [];

    for (var p0 in branch.warehouses) {
      warehouseList.add(DropdownMenuItem<int>(
        child: Text(p0.nameWarehouse),
        value: p0.id,
      ));
    }

    emit(state.warehouseDropdownList(
      warehouseList: warehouseList,
      state: States.loaded,
      branch: branch,
    ));
  }

  Future<void> getSections(int warehouseId) async {
    emit(state.sectionDropDownList(
      warehouseList: state.warehouseList,
      state: States.loading,
      branch: state.branch,
      sectionList: null,
    ));

    List<DropdownMenuItem<int>> sectionList = [];

    var warehouse =
        state.branch!.warehouses.firstWhere((p0) => p0.id == warehouseId);

    for (var p0 in warehouse.sections) {
      sectionList.add(DropdownMenuItem<int>(
        child: Text(p0.nameSection),
        value: p0.id,
      ));
    }

    emit(state.sectionDropDownList(
      warehouseList: state.warehouseList,
      state: States.loaded,
      branch: state.branch,
      sectionList: sectionList,
    ));
  }

  Future<void> addElement() async {
    final int numberOfElements = state.numberOfElements + 1;
    emit(state.sectionDropDownList(
      state: state.state,
      warehouseList: state.warehouseList,
      branch: state.branch,
      sectionList: state.sectionList,
      numberOfElements: numberOfElements,
    ));
  }
}
