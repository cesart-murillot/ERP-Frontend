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

class SaveQuantityEvent extends VerifyProductEntryEvent {
  final int quantity;
  const SaveQuantityEvent(this.quantity);

  @override
  List<Object> get props => [quantity];
}

class SaveSectionIdEvent extends VerifyProductEntryEvent {
  final int sectionId;
  const SaveSectionIdEvent(this.sectionId);

  @override
  List<Object> get props => [sectionId];
}

class StoreDataEvent extends VerifyProductEntryEvent {
  const StoreDataEvent();

  @override
  List<Object> get props => [];
}