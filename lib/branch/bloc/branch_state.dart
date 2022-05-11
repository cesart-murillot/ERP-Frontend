part of 'branch_bloc.dart';

abstract class BranchState extends Equatable {
  const BranchState();
}

class BranchInitialState extends BranchState {
  const BranchInitialState();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class BranchLoadingState extends BranchState {
  const BranchLoadingState();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class BranchLoadedState extends BranchState {
  final Branches? branches;
  const BranchLoadedState(this.branches);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class SingleBranchLoadedState extends BranchState {
  final Branch? branch;
  const SingleBranchLoadedState(this.branch);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class PopSingleBranch extends BranchState {
  const PopSingleBranch();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class BranchErrorState extends BranchState {
  final String message;
  const BranchErrorState(this.message);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class AddedBranchToList extends BranchState {
  final BranchForm? branchForm;
  const AddedBranchToList(this.branchForm);

  @override
  List<Object?> get props => [branchForm];
}

class ShowBranchDetails extends BranchState {
  final int id;
  const ShowBranchDetails(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  
}
