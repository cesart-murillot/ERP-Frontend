import 'package:bloc/bloc.dart';
import 'package:erp_fronted/branch/models/branch_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';
import 'package:flutter/material.dart';

import 'branch_drop_down_state.dart';

class BranchDropDownCubit extends Cubit<BranchDropDownState> {
  BranchDropDownCubit() : super(const BranchDropDownState().init());

  Future<void> getBranches() async {
    emit(state.copyWith(state: DropDownState.loadingState));

    Uri url = preDefinedUri('/api/branches/', {'only': 'name'});
    Branches branches = await getObject(url, Branches.serializer);

    List<DropdownMenuItem<int>> branchList = [];

    for (var p0 in branches.branches) {
      branchList.add(
        DropdownMenuItem<int>(
          child: Text(p0.nameBranch ?? 'no data'),
          value: p0.id,
        ),
      );
    }
    emit(state.copyWith(list: branchList, state: DropDownState.loadedState));
  }
}
