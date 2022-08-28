import 'package:equatable/equatable.dart';
enum States {initial, error}
class RegisterEntryOrderState extends Equatable {
  final List<Map<String, int>> productQuantity;
  final String? entryOrder;
  final String errorMessage;
  final States state;
  RegisterEntryOrderState init() {
    return const RegisterEntryOrderState();
  }

  RegisterEntryOrderState clone({String? entryOrder, List<Map<String, int>>? productQuantity}) {
    return RegisterEntryOrderState(
      entryOrder: entryOrder ?? this.entryOrder,
      productQuantity: productQuantity ?? this.productQuantity,
    );
  }

  RegisterEntryOrderState error({required String errorMessage}) {
    return RegisterEntryOrderState(
      entryOrder: entryOrder,
      productQuantity: productQuantity,
      errorMessage: errorMessage,
      state: States.error,
    );
  }

  @override
  List<Object?> get props => [
    productQuantity,
    entryOrder,
    state,
    errorMessage,
  ];

  const RegisterEntryOrderState({this.productQuantity = const [], this.entryOrder, this.errorMessage = '', this.state = States.initial});

}