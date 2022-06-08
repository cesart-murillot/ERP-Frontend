import 'package:equatable/equatable.dart';
import 'package:erp_fronted/branch/models/branch_model.dart';
import 'package:flutter/material.dart';

enum States { loading, loaded, initial }

class WarehouseDropDownState extends Equatable {
  final Branch? branch;
  final List<DropdownMenuItem<int>>? warehouseList;
  final List<DropdownMenuItem<int>>? sectionList;
  final States state;
  final int numberOfElements;

  WarehouseDropDownState init() {
    return const WarehouseDropDownState();
  }

  WarehouseDropDownState clone() {
    return const WarehouseDropDownState();
  }

  WarehouseDropDownState warehouseDropdownList({
    Branch? branch,
    List<DropdownMenuItem<int>>? warehouseList,
    required States state,
  }) {
    return WarehouseDropDownState(
      branch: branch ?? this.branch,
      warehouseList: warehouseList ?? this.warehouseList,
      state: state,
    );
  }

  WarehouseDropDownState sectionDropDownList({
    Branch? branch,
    List<DropdownMenuItem<int>>? warehouseList,
    List<DropdownMenuItem<int>>? sectionList,
    required States state,
    int? numberOfElements,
  }) {
    return WarehouseDropDownState(
      branch: branch ?? this.branch,
      warehouseList: warehouseList ?? this.warehouseList,
      sectionList: sectionList ?? this.sectionList,
      state: state,
      numberOfElements: numberOfElements ?? this.numberOfElements,
    );
  }

  @override
  List<Object?> get props => [warehouseList, sectionList, state, numberOfElements];

  const WarehouseDropDownState(
      {this.warehouseList,
      this.sectionList,
      this.state = States.initial,
      this.branch,
      this.numberOfElements = 1,
      });
}
