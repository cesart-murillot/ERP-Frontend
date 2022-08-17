import 'package:bloc/bloc.dart';

import 'product_stock_state.dart';

class ProductStockCubit extends Cubit<ProductStockState> {
  ProductStockCubit() : super(const ProductStockState().init());
}
