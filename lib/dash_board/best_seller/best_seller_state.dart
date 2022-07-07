import 'package:equatable/equatable.dart';

enum States { initial, loading, loaded, error }

class BestSellerState extends Equatable {
  final States state;
  final String? errorMessage;
  final String? productModel;
  final int? soldQuantity;
  final String? totalIncome;
  final int? productId;

  BestSellerState init() {
    return const BestSellerState();
  }

  BestSellerState clone() {
    return const BestSellerState();
  }

  BestSellerState loadedData({
    required States state,
    String? productModel,
    int? soldQuantity,
    String? totalIncome,
    int? productId,
  }) {
    return BestSellerState(
      state: state,
      productId: productId ?? this.productId,
      productModel: productModel ?? this.productModel,
      soldQuantity: soldQuantity ?? this.soldQuantity,
      totalIncome: totalIncome ?? this.totalIncome,
    );
  }

  BestSellerState error({required String errorMessage}) {
    return BestSellerState(
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

  const BestSellerState({
    this.productModel,
    this.soldQuantity,
    this.totalIncome,
    this.productId,
    this.state = States.initial,
    this.errorMessage,
  });
}
