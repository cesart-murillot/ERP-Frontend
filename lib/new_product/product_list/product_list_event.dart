import 'package:equatable/equatable.dart';

abstract class ProductListEvent extends Equatable {
  const ProductListEvent();
}

class InitEvent extends ProductListEvent {
  @override
  List<Object?> get props => [];
}