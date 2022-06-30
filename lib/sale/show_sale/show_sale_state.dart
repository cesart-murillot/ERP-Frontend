import 'package:equatable/equatable.dart';
import 'package:erp_fronted/sale/models/sale_model.dart';

enum States { initial, loading, loaded, error }

class ShowSaleState extends Equatable {
  final States state;
  final Sale? sale;
  final String? errorMessage;

  ShowSaleState init() {
    return const ShowSaleState();
  }

  ShowSaleState clone() {
    return const ShowSaleState();
  }

  ShowSaleState loadedData({
    required States state,
    Sale? sale,
  }) {
    return ShowSaleState(
      state: state,
      sale: sale ?? this.sale,
    );
  }

  @override
  List<Object?> get props => [
        state,
        sale,
        errorMessage,
      ];

  const ShowSaleState({
    this.state = States.initial,
    this.sale,
    this.errorMessage,
  });
}
