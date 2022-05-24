import 'package:equatable/equatable.dart';

abstract class ProductRequestEvent extends Equatable {}

class InitEvent extends ProductRequestEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}