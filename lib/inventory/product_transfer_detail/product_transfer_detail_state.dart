import 'package:equatable/equatable.dart';
import 'package:erp_fronted/product_request/models/transfer_model.dart';

enum States { initial, loading, loaded, error }

class ProductTransferDetailState extends Equatable {
  final States state;
  final String? errorMessage;
  final Transfer? transfer;
  final bool showErrorModal;
  final String? modalMessage;

  ProductTransferDetailState init() {
    return const ProductTransferDetailState();
  }

  ProductTransferDetailState clone() {
    return const ProductTransferDetailState();
  }

  ProductTransferDetailState showModal({
    required States state,
    required bool showErrorModal,
    String? modalMessage,
  }) {
    return ProductTransferDetailState(
      state: state,
      showErrorModal: showErrorModal,
      modalMessage: modalMessage ?? this.modalMessage,
    );
  }

  ProductTransferDetailState loadedData({
    required States state,
    Transfer? transfer,
    bool? showErrorModal,
    String? modalMessage,
  }) {
    return ProductTransferDetailState(
      state: state,
      transfer: transfer ?? this.transfer,
      showErrorModal: showErrorModal ?? this.showErrorModal,
      modalMessage: modalMessage ?? this.modalMessage,
    );
  }

  ProductTransferDetailState error({required String errorMessage}) {
    return ProductTransferDetailState(
      state: States.error,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        state,
        errorMessage,
        transfer,
        showErrorModal,
        modalMessage,
      ];

  const ProductTransferDetailState({
    this.showErrorModal = false,
    this.state = States.initial,
    this.errorMessage,
    this.transfer,
    this.modalMessage,
  });
}
