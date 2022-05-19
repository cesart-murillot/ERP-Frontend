import 'package:equatable/equatable.dart';
import 'package:erp_fronted/product_entry/models/product_entry_model.dart';

abstract class ProductEntryListState extends Equatable {
  const ProductEntryListState();
}

class InitialState extends ProductEntryListState {
  const InitialState();

  @override
  List<Object> get props => [];
}

class LoadingProductEntriesState extends ProductEntryListState {
  const LoadingProductEntriesState();

  @override
  List<Object> get props => [];
}

class LoadedProductEntriesState extends ProductEntryListState {
  const LoadedProductEntriesState(this.productEntries);
  final ProductEntries productEntries;
  @override
  List<Object> get props => [productEntries];
}

class ErrorLoadingState extends ProductEntryListState {
  const ErrorLoadingState();

  @override
  List<Object> get props => [];
}