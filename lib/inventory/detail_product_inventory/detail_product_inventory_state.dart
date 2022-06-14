import 'package:equatable/equatable.dart';
import 'package:erp_fronted/entry/models/entry_model.dart';
import 'package:erp_fronted/product/models/product_model.dart';

enum States { initial, loading, loaded, error }

class DetailProductInventoryState extends Equatable {
  final Product? product;
  final Entries? entries;
  final States state;
  final String? errorMessage;

  DetailProductInventoryState init() {
    return const DetailProductInventoryState();
  }

  DetailProductInventoryState clone() {
    return const DetailProductInventoryState();
  }

  DetailProductInventoryState loadedData({
    Product? product,
    required States state,
    Entries? entries,
  }) {
    return DetailProductInventoryState(
      state: state,
      product: product ?? this.product,
      entries: entries ?? this.entries,
    );
  }

  DetailProductInventoryState error({
    required String errorMessage,
  }) {
    return DetailProductInventoryState(
      state: States.error,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [product, entries, state, errorMessage];

  const DetailProductInventoryState({
    this.product,
    this.entries,
    this.state = States.initial,
    this.errorMessage,
  });
}
