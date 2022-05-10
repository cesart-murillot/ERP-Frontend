part of 'branch_bloc.dart';

abstract class BranchEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class FetchBranchesEvent extends BranchEvent {}

class FetchSingleBranchEvent extends BranchEvent {
  FetchSingleBranchEvent(this.id);
  final int id;
}

class AddBranchEvent extends BranchEvent {}
