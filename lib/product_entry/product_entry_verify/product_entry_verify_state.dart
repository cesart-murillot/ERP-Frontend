import 'package:equatable/equatable.dart';
import 'package:erp_fronted/product_entry/models/product_entry_model.dart';

abstract class ProductEntryVerifyState extends Equatable {
  const ProductEntryVerifyState();
}

class InitialState extends ProductEntryVerifyState {
  const InitialState();

  @override
  List<Object> get props => [];
}

class LoadingProductEntryState extends ProductEntryVerifyState {
  const LoadingProductEntryState();

  @override
  List<Object> get props => [];
}

class LoadedProductEntryState extends ProductEntryVerifyState {
  final ProductEntry productEntry;
  const LoadedProductEntryState(this.productEntry);

  @override
  List<Object> get props => [];
}

class ShowVerifyDialogState extends ProductEntryVerifyState {
  const ShowVerifyDialogState();

  @override
  List<Object> get props => [];
}