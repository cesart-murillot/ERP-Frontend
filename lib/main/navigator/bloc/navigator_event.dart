part of 'navigator_bloc.dart';

abstract class NavigatorEvent extends Equatable{
  const NavigatorEvent();
}

class NavigatorEventProductDetail extends NavigatorEvent {
  final Product product;
  const NavigatorEventProductDetail(this.product);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NavigatorEventProductCreate extends NavigatorEvent {
  const NavigatorEventProductCreate();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NavigatorEventEntryVerification extends NavigatorEvent {
  final Entry entry;
  const NavigatorEventEntryVerification(this.entry);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class NavigatorEventInitial extends NavigatorEvent {
/*  final Product product;
  const NavigatorEventProductDetail(this.product);*/

  @override
  // TODO: implement props
  List<Object?> get props => [];
}