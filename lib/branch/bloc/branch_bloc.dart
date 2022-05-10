import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:erp_fronted/branch/views/branch_create_page.dart';
import 'package:erp_fronted/src/resources/generic_serializer.dart';
import 'package:erp_fronted/src/resources/product_api_provider.dart';
import 'package:erp_fronted/src/resources/repository.dart';

import '../models/branch_model.dart';

part 'branch_event.dart';
part 'branch_state.dart';

class BranchBloc extends Bloc<BranchEvent, BranchState> {
  final Repository repository;

  BranchBloc(this.repository) : super(const BranchInitialState()) {
    on<FetchBranchesEvent>(_fetchBranches);
    on<FetchSingleBranchEvent>(_fetchSingleBranch);
  }

  Future<void> _fetchBranches(
      FetchBranchesEvent event, Emitter<BranchState> emitter) async {
    emitter(const BranchLoadingState());
    try {
      final String branchesString =
          await repository.fetchData(UnEncodePath.branches);
      final branches =
          parseObject<Branches>(branchesString, Branches.serializer);
      emitter(BranchLoadedState(branches));
    } catch (e) {
      emitter(BranchErrorState(e.toString()));
    }
  }

  Future<void> _fetchSingleBranch(
      FetchSingleBranchEvent event, Emitter<BranchState> emitter) async {
    emitter(const BranchLoadingState());
    try {
      final branchString = await repository.fetchData(
          UnEncodePath.branches, event.id.toString());
      final branch = parseObject<Branch>(branchString, Branch.serializer);
      emitter(SingleBranchLoadedState(branch));
      print(branch);
    } on Exception catch (e) {
      // TODO
    }
  }
}
