import 'package:equatable/equatable.dart';

abstract class WarehouseListEvent extends Equatable {
  const WarehouseListEvent();
}

class InitEvent extends WarehouseListEvent {
  @override
  List<Object?> get props => [];
}

class ShowBranchEvent extends WarehouseListEvent {
  final int branchId;

  const ShowBranchEvent(this.branchId);
  @override
  List<Object?> get props => [branchId];
}