import 'package:equatable/equatable.dart';
import 'package:erp_fronted/branch/models/branch_model.dart';
import 'package:erp_fronted/employee/models/user_model.dart';

enum RequestProductViewState { initial, loaded, loading }

class RequestProductState extends Equatable {
  final RequestProductViewState state;
  final User? user;
  final Branch? branch;

  RequestProductState loadedInfo({
    User? user,
    Branch? branch,
    required RequestProductViewState state,
  }) {
    return RequestProductState(
      user: user ?? this.user,
      state: state,
      branch: branch ?? this.branch,
    );
  }

  RequestProductState init() {
    return const RequestProductState();
  }

  @override
  List<Object?> get props => [state, user];

  const RequestProductState(
      {this.user, this.state = RequestProductViewState.initial, this.branch});
}
