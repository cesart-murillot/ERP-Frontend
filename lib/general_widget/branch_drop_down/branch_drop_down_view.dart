import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'branch_drop_down_cubit.dart';
import 'branch_drop_down_state.dart';

class BranchDropDownPage extends StatelessWidget {
  BranchDropDownPage({Key? key, required this.onSavedCallback})
      : super(key: key);
  final Function(TextEditingController) onSavedCallback;
  final TextEditingController _branchDropDownController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BranchDropDownCubit()..getBranches(),
      child: BlocBuilder<BranchDropDownCubit, BranchDropDownState>(
        builder: (context, state) {
          switch (state.state) {
            case DropDownState.initialState:
              return const Center(
                child: CircularProgressIndicator(),
              );
              break;
            case DropDownState.loadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case DropDownState.loadedState:
              return Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.warehouse, color: Colors.grey,),
                  ),
                  Flexible(
                    child: DropdownButtonFormField(
                      enableFeedback: true,
                      isExpanded: true,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                      ),
                      onSaved: (value) {
                        _branchDropDownController.text = value.toString();
                        onSavedCallback(_branchDropDownController);
                      },
                      decoration: const InputDecoration(
                        labelText: 'Sucursal',
                      ),
                      items: state.list,
                      onChanged: (value) {},
                    ),
                  ),
                ],
              );
            default:
              return const Center(
                child: Text('error'),
              );
          }
        },
      ),
    );
  }
}