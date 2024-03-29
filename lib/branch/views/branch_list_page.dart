import 'package:erp_fronted/branch/bloc/branch_bloc.dart';
import 'package:erp_fronted/branch/views/branch_detail_page.dart';
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
        child: const AppNavigator(),
      ),
    );
  }
}

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BranchBloc, BranchState>(
      builder: (context, state) {
        return Navigator(
          pages: [
            const MaterialPage(
              child: DisplayBranches(),
            ),
            if (state is SingleBranchLoadedState)
            MaterialPage(child: BranchDetail(state.branch!))
/*
          if(state is SingleBranchLoadedState)
            MaterialPage(child: BranchDetail(state.branch!)),
*/
          ],
          onPopPage: (route, result){
            context.read<BranchBloc>().add(FetchBranchesEvent());
            return route.didPop(result);
          },
        );
      },
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
                  context.read<BranchBloc>().add(FetchSingleBranchEvent(
                      state.branches!.branches[index].id!));
                },
                subtitle: Text(state.branches!.branches[index].addressBranch!),
                title: Text(state.branches!.branches[index].nameBranch!),
              );
            },
          );
        } else if (state is BranchErrorState) {
        } /*else if (state is SingleBranchLoadedState) {
          return Card(
            child: Text(state.branch!.nameBranch!),
          );*/
        return Container(
          child: const Text('Error!!'),
        );
      },
    );
  }
}
