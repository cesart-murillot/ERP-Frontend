import 'package:equatable/equatable.dart';

abstract class VerifyProductEntryEvent extends Equatable {
  const VerifyProductEntryEvent();
}

class InitEvent extends VerifyProductEntryEvent {
  final int productEntryId;

  @override
  List<Object?> get props => [productEntryId];

  const InitEvent(this.productEntryId);
}