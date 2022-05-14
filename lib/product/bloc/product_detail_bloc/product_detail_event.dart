part of 'product_detail_cubit.dart';

abstract class ProductDetailEvent extends Equatable {
}

class ProductDetailEventPostProductChanges extends ProductDetailEvent {
  final String changes;

  ProductDetailEventPostProductChanges(this.changes);

  @override
  // TODO: implement props
  List<Object?> get props => [changes];

}