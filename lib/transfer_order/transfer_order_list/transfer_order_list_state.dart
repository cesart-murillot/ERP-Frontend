import 'package:equatable/equatable.dart';
import 'package:erp_fronted/transfer_order/models/transfer_order_model.dart';

enum States {initial, loading, loaded, reload, error}
class TransferOrderListState extends Equatable {

  final States state;
  final TransferOrders? transferOrders;
  final String? errorString;

  TransferOrderListState init() {
    return const TransferOrderListState();
  }

  TransferOrderListState loadingData({TransferOrders? transferOrders, required States state}) {
    return TransferOrderListState(transferOrders: transferOrders, state: state);
  }

  TransferOrderListState error(String error) {
    return TransferOrderListState(state: States.error, errorString: error);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];

  const TransferOrderListState({this.state = States.initial, this.transferOrders, this.errorString});
}
