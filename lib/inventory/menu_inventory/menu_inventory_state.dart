import 'package:equatable/equatable.dart';

class MenuInventoryState extends Equatable {
  final int roleId;

  MenuInventoryState init() {
    return const MenuInventoryState();
  }

  MenuInventoryState clone({int? roleId}) {
    return MenuInventoryState(roleId: roleId ?? this.roleId);
  }

  const MenuInventoryState({this.roleId = 0});

  @override
  List<Object?> get props => [roleId];
}
