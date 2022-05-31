import 'package:equatable/equatable.dart';
import 'package:erp_fronted/transfer_order/models/transfer_order_model.dart';

enum States { initial, loading, loaded, reloading, error }

class CheckTransferOrderState extends Equatable {
  final TransferOrder? transferOrder;
  final States state;
  final String? errorString;

  CheckTransferOrderState init() {
    return const CheckTransferOrderState();
  }

  CheckTransferOrderState clone() {
    return const CheckTransferOrderState();
  }

  CheckTransferOrderState loadingData({
    TransferOrder? transferOrder,
    required States state,
  }) {
    return CheckTransferOrderState(
      transferOrder: transferOrder,
      state: state,
    );
  }

  CheckTransferOrderState error(String error) {
    return CheckTransferOrderState(
      state: States.error,
      errorString: error,
    );
  }

  @override
  List<Object?> get props => [errorString, transferOrder, state];

  const CheckTransferOrderState(
      {this.errorString, this.transferOrder, this.state = States.initial});
}
