import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ProductDropdownState extends Equatable {
  final List<DropdownMenuItem<List<int>>>? productItems;

  ProductDropdownState init() {
    return const ProductDropdownState();
  }

  ProductDropdownState clone() {
    return const ProductDropdownState();
  }

  ProductDropdownState itemsLoaded({required List<DropdownMenuItem<List<int>>> productItems}) {
    return ProductDropdownState(productItems: productItems);
  }

  @override
  List<Object?> get props => [];

  const ProductDropdownState({this.productItems});
}
