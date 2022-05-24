import 'package:bloc/bloc.dart';
import 'package:erp_fronted/role/models/role_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';
import 'package:flutter/material.dart';

import 'role_drop_down_state.dart';

class RoleDropDownCubit extends Cubit<RoleDropDownState> {
  RoleDropDownCubit() : super(const RoleDropDownState().init());

  Future<void> getRoles() async {
    emit(state.clone(state: RoleDropDownWidgetState.loadingState));
    Uri url = preDefinedUri('/api/roles/');
    Roles roles = await getObject(url, Roles.serializer);

    List<DropdownMenuItem<int>> roleList = [];

    for (var p0 in roles.roles) {
      roleList.add(
        DropdownMenuItem<int>(
          child: Text(p0.nameRole),
          value: p0.id,
        ),
      );
    }
    print(roleList.length);
    emit(state.clone(state: RoleDropDownWidgetState.loadedState, list: roleList));
  }
}
