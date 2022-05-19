import 'package:equatable/equatable.dart';

abstract class ProductEntryListEvent extends Equatable {

  const ProductEntryListEvent();
}

class InitEvent extends ProductEntryListEvent {
  @override
  List<Object?> get props => [];

  const InitEvent();
}

class GetProductEntryEvent extends ProductEntryListEvent {
  const GetProductEntryEvent();

  @override
  List<Object> get props => [];
}

class ShowProductEntryEvent extends ProductEntryListEvent {
  final int productEntryId;
  const ShowProductEntryEvent(this.productEntryId);
  @override
  List<Object> get props => [];
}