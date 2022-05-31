import 'package:equatable/equatable.dart';
import 'package:erp_fronted/employee/models/user_model.dart';

enum MainViewState { loadedInfo, loadingInfo, initState, pageChanged }
enum AppPage {
  product,
  inventory,
  billing,
  employee,
  branch,
  homepage,
  entry,
  productEntry,
  productRequest,
}

class MainState extends Equatable {
  final User? user;
  final MainViewState state;
  final AppPage page;

  MainState init() {
    return const MainState();
  }

  MainState clone() {
    return const MainState();
  }

  MainState currentPage({required AppPage page, User? user}) {
    return MainState(
        page: page, user: user ?? this.user, state: MainViewState.loadedInfo);
  }

  MainState loadedInfo({required User user}) {
    return MainState(user: user, state: MainViewState.loadedInfo);
  }

  const MainState(
      {this.user,
      this.state = MainViewState.initState,
      this.page = AppPage.homepage});

  @override
  // TODO: implement props
  List<Object?> get props => [user, state, page];
}
