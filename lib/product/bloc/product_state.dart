part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductStateInitial extends ProductState {
  const ProductStateInitial();
}

class ProductStateLoading extends ProductState {
  const ProductStateLoading();
}

class ProductStateProductListLoaded extends ProductState {
  final Products products;
  const ProductStateProductListLoaded(this.products);
}

class ProductStateError extends ProductState {
  final String errorMessage;
  const ProductStateError(this.errorMessage);
}

class ProductStateLoadingSuggestedProducts extends ProductState {
  const ProductStateLoadingSuggestedProducts();
}

class ProductStateSuggestedProducts extends ProductState {
  final Products products;
  const ProductStateSuggestedProducts(this.products);
}

class ProductStateShowProduct extends ProductState {
  const ProductStateShowProduct();
}

class ProductStateDebug extends ProductState {
  final String debug;

  const ProductStateDebug(this.debug);
}

class ProductInitial extends ProductState {
  const ProductInitial();
}

class ProductLoading extends ProductState {
  const ProductLoading();
}

class ProductLoaded extends ProductState {
  final Products? products;
  const ProductLoaded(this.products);
}

class ProductError extends ProductState {
  final String message;
  const ProductError(this.message);
}

abstract class ProductSearchBarState extends Equatable {
}

class ProductSearchBarStateLoadingSuggestions extends ProductSearchBarState {
  ProductSearchBarStateLoadingSuggestions();
  @override
  List<Object?> get props => [];
}

class ProductSearchBarStateProductSuggestions extends ProductSearchBarState {
  final Products products;

  ProductSearchBarStateProductSuggestions(this.products);

  @override
  List<Object?> get props => [products];
}

class ProductSearchBarStateInitial extends ProductSearchBarState {

  ProductSearchBarStateInitial();

  @override
  List<Object?> get props => [];
}