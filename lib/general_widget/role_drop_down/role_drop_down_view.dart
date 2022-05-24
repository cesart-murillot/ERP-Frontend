import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'role_drop_down_cubit.dart';
import 'role_drop_down_state.dart';

class RoleDropDownPage extends StatelessWidget {
  RoleDropDownPage({Key? key, required this.onSaveCallback}) : super(key: key);

  final Function(TextEditingController) onSaveCallback;
  final TextEditingController _roleDropDownController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RoleDropDownCubit()..getRoles(),
      child: BlocBuilder<RoleDropDownCubit, RoleDropDownState>(
        builder: (context, state) {
          switch (state.state) {
            case RoleDropDownWidgetState.initialState:
              return const Text('Initial State');
            case RoleDropDownWidgetState.loadingState:
              return const Text('Loading State');
            case RoleDropDownWidgetState.loadedState:
              return Row(
                children: [
                  Flexible(
                    child: DropdownButtonFormField(
                      icon: const Icon(
                        Icons.arrow_drop_down,
                      ),
                      onSaved: (value) {
                        _roleDropDownController.text = value.toString();
                        onSaveCallback(_roleDropDownController);

                      },
                      decoration: const InputDecoration(
                        icon: Icon(Icons.work),
                        labelText: 'Role',
                      ),
                      items: state.list,
                      onChanged: (value) {},
                    ),
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}
