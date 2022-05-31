import 'package:equatable/equatable.dart';
import 'package:erp_fronted/product_request/models/transfer_model.dart';

enum States {initial, loading, loaded}
class VerifyProductRequestState extends Equatable {
  final States state;
  final Transfer? transfer;
  VerifyProductRequestState init() {
    return const VerifyProductRequestState();
  }

  VerifyProductRequestState clone() {
    return const VerifyProductRequestState();
  }

  VerifyProductRequestState loadedInfo({Transfer? transfer, required States state}) {
    return VerifyProductRequestState(transfer: transfer, state: state);
  }

  @override
  List<Object?> get props => [state, transfer];

  const VerifyProductRequestState({this.state = States.initial, this.transfer});
}
