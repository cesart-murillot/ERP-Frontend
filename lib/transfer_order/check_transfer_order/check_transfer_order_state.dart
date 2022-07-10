import 'package:equatable/equatable.dart';
import 'package:erp_fronted/transfer_order/models/transfer_order_model.dart';

enum States { initial, loading, loaded, reloading, error }
enum Dialogs { sent, received, none }

class CheckTransferOrderState extends Equatable {
  final TransferOrder? transferOrder;
  final States state;
  final String? errorString;
  final Dialogs dialog;
  final int roleId;

  CheckTransferOrderState init() {
    return const CheckTransferOrderState();
  }

  CheckTransferOrderState clone() {
    return const CheckTransferOrderState();
  }

  CheckTransferOrderState loadingData({
    TransferOrder? transferOrder,
    required States state,
    Dialogs? dialog,
    int? roleId,
  }) {
    return CheckTransferOrderState(
      transferOrder: transferOrder ?? this.transferOrder,
      state: state,
      dialog: dialog ?? this.dialog,
      roleId: roleId ?? this.roleId,
    );
  }

  CheckTransferOrderState error(String error) {
    return CheckTransferOrderState(
      state: States.error,
      errorString: error,
    );
  }

  CheckTransferOrderState hideDialog() {
    return const CheckTransferOrderState(
        dialog: Dialogs.none, state: States.loaded);
  }

  @override
  List<Object?> get props => [
        errorString,
        transferOrder,
        state,
        dialog,
        roleId,
      ];

  const CheckTransferOrderState(
      {this.errorString,
      this.transferOrder,
      this.state = States.initial,
      this.dialog = Dialogs.none,
      this.roleId = 0});
}
