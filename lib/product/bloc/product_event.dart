part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
}

class ProductEventGetProductList extends ProductEvent{
  @override
  List<Object?> get props => [];

}

class ProductEventSuggestProduct extends ProductEvent {
  final String query;
  ProductEventSuggestProduct(this.query);
  @override
  List<Object?> get props => [query];
}

class ProductEventGetProductDetails extends ProductEvent {
  final Product product;
  @override
  List<Object?> get props => throw UnimplementedError();

  ProductEventGetProductDetails(this.product);
}

class ProductEventCloseProductDetails extends ProductEvent {
  @override
  List<Object?> get props => [];
}

class InitialEvent extends ProductEvent{
  @override
  List<Object?> get props => [];
}

class ProductFetch extends ProductEvent{
  @override
  List<Object?> get props => [];
}

abstract class ProductSearchBarEvent extends Equatable {
}

class ProductSearchBarEventGetProductSuggestions extends ProductSearchBarEvent {

  @override
  List<Object?> get props => [query];

  final String query;
  ProductSearchBarEventGetProductSuggestions(this.query);
}

