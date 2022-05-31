import 'package:equatable/equatable.dart';

abstract class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();
}

class InitEvent extends ProductDetailEvent {
  final int productId;
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  const InitEvent(this.productId);
}