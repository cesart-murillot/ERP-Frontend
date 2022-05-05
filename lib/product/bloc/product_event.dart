part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialEvent extends ProductEvent{}

class ProductFetch extends ProductEvent{}