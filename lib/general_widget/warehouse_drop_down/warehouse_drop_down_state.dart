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

  final void Function(int)? callbackFunction;


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
    required void Function(int) callbackFunction,
  }) {
    return WarehouseDropDownState(
      branch: branch ?? this.branch,
      warehouseList: warehouseList ?? this.warehouseList,
      state: state,
      callbackFunction: callbackFunction,
    );
  }

  WarehouseDropDownState sectionDropDownList({
    Branch? branch,
    List<DropdownMenuItem<int>>? warehouseList,
    List<DropdownMenuItem<int>>? sectionList,
    required States state,
    int? numberOfElements,
    String? quantity,
    String? sectionId,
    void Function(int)? callbackFunction,
  }) {
    return WarehouseDropDownState(
      branch: branch ?? this.branch,
      warehouseList: warehouseList ?? this.warehouseList,
      sectionList: sectionList ?? this.sectionList,
      state: state,
      numberOfElements: numberOfElements ?? this.numberOfElements,
      callbackFunction: callbackFunction ?? this.callbackFunction,
    );
  }

  @override
  List<Object?> get props =>
      [warehouseList, sectionList, state, numberOfElements, callbackFunction];

  const WarehouseDropDownState({
    this.warehouseList,
    this.sectionList,
    this.state = States.initial,
    this.branch,
    this.numberOfElements = 1,
    this.callbackFunction,
  });
}
