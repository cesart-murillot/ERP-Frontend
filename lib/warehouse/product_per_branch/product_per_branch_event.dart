import 'package:equatable/equatable.dart';

abstract class ProductPerBranchEvent extends Equatable {}

class InitEvent extends ProductPerBranchEvent {
  final int branchId;
  @override
  List<Object?> get props => [branchId];

  InitEvent(this.branchId);
}