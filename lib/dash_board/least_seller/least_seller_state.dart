import 'package:equatable/equatable.dart';

enum States { initial, loading, loaded, error }

class LeastSellerState extends Equatable {
  final States state;
  final String? errorMessage;
  final String? productModel;
  final int? soldQuantity;
  final String? totalIncome;
  final int? productId;

  LeastSellerState init() {
    return const LeastSellerState();
  }

  LeastSellerState clone() {
    return const LeastSellerState();
  }

  LeastSellerState loadedData({
    required States state,
    String? productModel,
    int? soldQuantity,
    String? totalIncome,
    int? productId,
  }) {
    return LeastSellerState(
      state: state,
      productId: productId ?? this.productId,
      productModel: productModel ?? this.productModel,
      soldQuantity: soldQuantity ?? this.soldQuantity,
      totalIncome: totalIncome ?? this.totalIncome,
    );
  }

  LeastSellerState error({required String errorMessage}) {
    return LeastSellerState(
      state: States.error,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    state,
    errorMessage,
    productModel,
    soldQuantity,
    totalIncome,
    productId,
  ];

  const LeastSellerState({
    this.state = States.initial,
    this.errorMessage,
    this.productModel,
    this.soldQuantity,
    this.totalIncome,
    this.productId,
  });
}
