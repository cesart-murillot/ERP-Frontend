part of 'app_bar_bloc.dart';

abstract class AppBarEvent extends Equatable {}

class AppBarEventProduct extends AppBarEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AppBarEventMain extends AppBarEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AppBarEventGeneric extends AppBarEvent {
  final String page;
  AppBarEventGeneric(this.page);
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}