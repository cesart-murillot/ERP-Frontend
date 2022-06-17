import 'package:equatable/equatable.dart';
import 'package:erp_fronted/product_request/models/transfer_model.dart';

enum States {loading, loaded, initial, error}
class ListProductRequestState extends Equatable {
  final Transfers? transfers;
  final States state;
  final String? errorMessage;

  ListProductRequestState init() {
    return const ListProductRequestState();
  }

  ListProductRequestState clone() {
    return const ListProductRequestState();
  }

  ListProductRequestState loadingInfo({Transfers? transfers, required States state}) {
    return ListProductRequestState(transfers: transfers, state: state);
  }

  ListProductRequestState error({required String errorMessage,}) {
    return ListProductRequestState(errorMessage: errorMessage, state: States.error,);
  }

  @override
  List<Object?> get props => [transfers, state, errorMessage,];

  const ListProductRequestState({this.transfers, this.state = States.initial, this.errorMessage,});
}
