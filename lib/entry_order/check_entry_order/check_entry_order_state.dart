import 'package:equatable/equatable.dart';
import 'package:erp_fronted/entry_order/models/entry_order_model.dart';

enum States { initial, loading, checked, unchecked, error }

class CheckEntryOrderState extends Equatable {
  final EntryOrder? entryOrder;
  final States state;
  final List<bool>? verified;
  final bool showVerifyButton;

  CheckEntryOrderState init() {
    return const CheckEntryOrderState();
  }

  CheckEntryOrderState clone() {
    return const CheckEntryOrderState();
  }

  CheckEntryOrderState loadedData({
    EntryOrder? entryOrder,
    required States state,
    List<bool>? verified,
    bool? showVerifyButton,
  }) {
    return CheckEntryOrderState(
      entryOrder: entryOrder ?? this.entryOrder,
      state: state,
      verified: verified ?? this.verified,
      showVerifyButton: showVerifyButton ?? this.showVerifyButton,
    );
  }

  @override
  List<Object?> get props => [entryOrder, state, verified];

  const CheckEntryOrderState(
      {this.entryOrder, this.state = States.initial, this.verified, this.showVerifyButton = false});
}
