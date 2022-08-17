import 'package:erp_fronted/branch/bloc/branch_bloc.dart';
import 'package:erp_fronted/branch/views/branch_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocListener<BranchBloc, BranchState>(
      listener: (context, state) {
        if(state is SingleBranchLoadedState)
          {
            print('naviagotr');
          }
      },
      child: Navigator(
        pages: const [
          MaterialPage(
            child: BranchList(),
          ),
/*
          if(state is SingleBranchLoadedState)
            MaterialPage(child: BranchDetail(state.branch!)),
*/

        ],
        onPopPage: (route, result){
          return route.didPop(result);
        },
      ),
    );
  }
}
