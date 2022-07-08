import 'package:bloc/bloc.dart';
import 'package:erp_fronted/product/models/product_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';

import 'product_per_branch_event.dart';
import 'product_per_branch_state.dart';

class ProductPerBranchBloc extends Bloc<ProductPerBranchEvent, ProductPerBranchState> {
  ProductPerBranchBloc() : super(const ProductPerBranchState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<ProductPerBranchState> emit) async {
    emit(state.loadedData(state: States.loading));
    
    final url = preDefinedUri('/api/entries/branchProduct/${event.branchId}');
    try {
      final products = await getObject(url, Products.serializer);
      emit(state.loadedData(state: States.loaded, products: products));
    } catch (e) {
      emit(state.error(errorMessage: e.toString()));
    }

  }
}
