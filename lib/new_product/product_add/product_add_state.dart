import 'package:equatable/equatable.dart';

class ProductAddState extends Equatable {
  final bool showAdditionalInformation;
  final bool showTechnicalInformation;

  ProductAddState init() {
    return const ProductAddState();
  }

  ProductAddState clone() {
    return const ProductAddState();
  }

  ProductAddState addAddInfo({
    required bool addInfo,
    required bool techInfo,
  }) {
    return ProductAddState(
      showAdditionalInformation: addInfo,
      showTechnicalInformation: techInfo,
    );
  }

  ProductAddState addTechInfo({
    required bool techInfo,
  }) {
    return ProductAddState(
      showTechnicalInformation: techInfo,
    );
  }

  @override
  List<Object?> get props => [showAdditionalInformation, showTechnicalInformation];

  const ProductAddState({
    this.showAdditionalInformation = false,
    this.showTechnicalInformation = false,
  });
}
