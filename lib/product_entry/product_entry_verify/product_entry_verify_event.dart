import 'package:equatable/equatable.dart';

abstract class ProductEntryVerifyEvent extends Equatable {
  const ProductEntryVerifyEvent();
}

class InitEvent extends ProductEntryVerifyEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  const InitEvent();
}

class GetProductEntryEvent extends ProductEntryVerifyEvent {
  final int productEntryId;
  const GetProductEntryEvent(this.productEntryId);

  @override
  List<Object> get props => [];
}

class VerifyProductEntry extends ProductEntryVerifyEvent {
  const VerifyProductEntry();

  @override
  List<Object> get props => [];
}

class ConfirmProductEntryEvent extends ProductEntryVerifyEvent {
  const ConfirmProductEntryEvent();

  @override
  List<Object> get props => [];
}