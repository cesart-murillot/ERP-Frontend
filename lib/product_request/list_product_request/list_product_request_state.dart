import 'package:equatable/equatable.dart';
import 'package:erp_fronted/product_request/models/transfer_model.dart';

enum States {loading, loaded, initial}
class ListProductRequestState extends Equatable {
  final Transfers? transfers;
  final States state;
  ListProductRequestState init() {
    return const ListProductRequestState();
  }

  ListProductRequestState clone() {
    return const ListProductRequestState();
  }

  ListProductRequestState loadingInfo({Transfers? transfers, required States state}) {
    return ListProductRequestState(transfers: transfers, state: state);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [transfers, state];

  const ListProductRequestState({this.transfers, this.state = States.initial});
}
