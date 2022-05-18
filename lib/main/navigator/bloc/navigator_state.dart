part of 'navigator_bloc.dart';

abstract class NavigatorState extends Equatable {
  const NavigatorState();
}

class NavigatorStateInitial extends NavigatorState {

  const NavigatorStateInitial();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class NavigatorStateProductDetail extends NavigatorState {
  final Product product;

  const NavigatorStateProductDetail(this.product);

  @override
  // TODO: implement props
  List<Object?> get props => [product];
}

class NavigatorStateProductCreate extends NavigatorState {

  const NavigatorStateProductCreate();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NavigatorStateEntryVerification extends NavigatorState {
  final Entry entry;
  const NavigatorStateEntryVerification(this.entry);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}