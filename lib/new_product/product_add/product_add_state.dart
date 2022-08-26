import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ProductAddState extends Equatable {
  final bool showAdditionalInformation;
  final bool showTechnicalInformation;

  final XFile? image;
  final String model;
  final String format;

  ProductAddState init() {
    return const ProductAddState();
  }

  ProductAddState clone({
    XFile? image,
    String? model,
    String? format,
  }) {
    return ProductAddState(
      image: image ?? this.image,
      model: model ?? this.model,
      format: format ?? this.format,
    );
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
  List<Object?> get props => [
        showAdditionalInformation,
        showTechnicalInformation,
        image,
        format,
        model,
      ];

  const ProductAddState({
    this.format = '',
    this.model = '',
    this.image,
    this.showAdditionalInformation = false,
    this.showTechnicalInformation = false,
  });
}
