part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
}

class GetEmployeeInfoEvent extends MainEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class RedirectToPage extends MainEvent {
  final String page;
  RedirectToPage(this.page);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
