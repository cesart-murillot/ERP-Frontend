part of 'branch_bloc.dart';

abstract class BranchEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}


class FetchBranchesEvent extends BranchEvent {}

class FetchBranchEvent extends BranchEvent {}

class AddBranchEvent extends BranchEvent{}