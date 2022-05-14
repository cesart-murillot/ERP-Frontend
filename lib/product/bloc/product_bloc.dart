import 'dart:async';

import 'package:erp_fronted/src/resources/generic_serializer.dart';
import 'package:erp_fronted/src/resources/product_api_provider.dart';
import 'package:erp_fronted/src/resources/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:erp_fronted/product/models/product_model.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final Repository repository;

  ProductBloc(this.repository) : super(const ProductStateInitial()) {
    on<ProductFetch>(_fetchProducts);

    on<ProductEventGetProductList>(_getProductList);
    //on<ProductEventSuggestProduct>(_getProductSuggestions);

    on<ProductEventCloseProductDetails>((event, emit) => emit(const ProductStateInitial()));
    on<ProductEventGetProductDetails>((event, emit) => emit(ProductStateShowProduct(event.product)),);
  }

  Future<void> _getProductList(ProductEventGetProductList event, Emitter<ProductState> emitter) async {
    emitter(const ProductStateLoading());
    try {
      final String productString = await repository.fetchData(UnEncodePath.products);
      final Products products = parseObject(productString, Products.serializer);
      emitter(ProductStateProductListLoaded(products));
    } catch (e) {
      emitter(ProductStateError(e.toString()));
    }
  }

  Future<void> _fetchProducts(ProductFetch event, Emitter<ProductState> emit) async {
    emit(const ProductLoading());
    try{
      final products = await repository.fetchProductList();
      emit(ProductLoaded(products));
    } catch(e) {
      emit(const ProductError("Failed"));
    }
  }
}

class ProductSearchBarBloc extends Bloc<ProductSearchBarEvent, ProductSearchBarState> {
  final Repository repository;
  ProductSearchBarBloc(this.repository) : super(ProductSearchBarStateInitial()) {
   on<ProductSearchBarEventGetProductSuggestions>(_getProductSuggestions);
  }

  FutureOr<void> _getProductSuggestions(ProductSearchBarEventGetProductSuggestions event, Emitter<ProductSearchBarState> emit) async {
    emit(ProductSearchBarStateLoadingSuggestions());
    try {
      final String productSuggestionString = await repository.fetchData(UnEncodePath.products, '', {'search': event.query});
      final Products productSuggestion = parseObject(productSuggestionString, Products.serializer);
      emit(ProductSearchBarStateProductSuggestions(productSuggestion));
    } catch(e) {
      print(e.toString());
    }
  }
}