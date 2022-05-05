import 'package:erp_fronted/src/resources/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:erp_fronted/product/models/product_model.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final Repository repository;

  ProductBloc(this.repository) : super(const ProductInitial()) {
    on<ProductFetch>(_fetchProducts);
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