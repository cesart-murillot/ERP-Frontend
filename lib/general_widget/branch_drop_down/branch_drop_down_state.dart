import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum DropDownState { initialState, loadingState, loadedState }

class BranchDropDownState extends Equatable {
  final List<DropdownMenuItem<int>>? list;
  final DropDownState state;

  BranchDropDownState init() {
    return const BranchDropDownState();
  }

  BranchDropDownState clone() {
    return const BranchDropDownState();
  }

  BranchDropDownState copyWith(
      {List<DropdownMenuItem<int>>? list, DropDownState? state}) {
    return BranchDropDownState(
      list: list ?? this.list,
      state: state ?? this.state,
    );
  }

  const BranchDropDownState(
      {this.list, this.state = DropDownState.initialState});

  @override
  List<Object?> get props => [list, state];
}
