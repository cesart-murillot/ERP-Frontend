import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum RoleDropDownWidgetState { initialState, loadingState, loadedState }

class RoleDropDownState extends Equatable {
  final List<DropdownMenuItem<int>>? list;
  final RoleDropDownWidgetState state;

  RoleDropDownState init() {
    return const RoleDropDownState();
  }

  RoleDropDownState clone(
      {List<DropdownMenuItem<int>>? list,
      required RoleDropDownWidgetState state}) {
    return RoleDropDownState(
      list: list ?? this.list,
      state: state,
    );
  }

  @override
  List<Object?> get props => [list, state];

  const RoleDropDownState(
      {this.list, this.state = RoleDropDownWidgetState.initialState});
}
