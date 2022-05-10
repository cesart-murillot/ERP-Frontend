import 'package:erp_fronted/branch/bloc/branch_bloc.dart';
import 'package:erp_fronted/src/resources/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BranchList extends StatelessWidget {
  const BranchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            BranchBloc(Repository())..add(FetchBranchesEvent()),
        child: const DisplayBranches(),
      ),
    );
  }
}

class DisplayBranches extends StatefulWidget {
  const DisplayBranches({Key? key}) : super(key: key);

  @override
  State<DisplayBranches> createState() => _DisplayBranchesState();
}

class _DisplayBranchesState extends State<DisplayBranches> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BranchBloc, BranchState>(
      builder: (context, state) {
        if (state is BranchInitialState) {
          return const Text('Initial state');
        } else if (state is BranchLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is BranchLoadedState) {
          return ListView.builder(
            itemCount: state.branches!.branches.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: const FlutterLogo(),
                onTap: () {
                  context.read<BranchBloc>().add(AddBranchEvent());
                },
                subtitle: Text(state.branches!.branches[index].addressBranch!),
                title: Text(state.branches!.branches[index].nameBranch!),
              );
            },
          );
        } else if (state is BranchErrorState) {}
        return Container(child: Text('Hola'),);
      },
    );
  }
}
