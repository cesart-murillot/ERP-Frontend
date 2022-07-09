import 'package:equatable/equatable.dart';

enum States { initial, loading, loaded, error }

class EntryOrderKeyState extends Equatable {
  final String? errorMessage;
  final States state;
  final int? totalEntryOrders;
  final int? verifiedEntryOrders;
  final int? errorEntryOrders;
  final int? todayEntryOrders;

  EntryOrderKeyState init() {
    return const EntryOrderKeyState();
  }

  EntryOrderKeyState clone() {
    return const EntryOrderKeyState();
  }

  EntryOrderKeyState loadedData({
    required States state,
    int? totalEntryOrders,
    int? verifiedEntryOrders,
    int? errorEntryOrders,
    int? todayEntryOrders,
  }) {
    return EntryOrderKeyState(
      state: state,
      totalEntryOrders: totalEntryOrders ?? this.totalEntryOrders,
      verifiedEntryOrders: verifiedEntryOrders ?? this.verifiedEntryOrders,
      errorEntryOrders: errorEntryOrders ?? this.errorEntryOrders,
      todayEntryOrders: todayEntryOrders ?? this.totalEntryOrders,
    );
  }

  EntryOrderKeyState error({required String errorMessage}) {
    return EntryOrderKeyState(
      errorMessage: errorMessage,
      state: States.error,
    );
  }

  const EntryOrderKeyState({
    this.totalEntryOrders,
    this.verifiedEntryOrders,
    this.errorEntryOrders,
    this.todayEntryOrders,
    this.errorMessage,
    this.state = States.initial,
  });

  @override
  List<Object?> get props => [
        errorMessage,
        state,
        totalEntryOrders,
        verifiedEntryOrders,
        errorEntryOrders,
        todayEntryOrders,
      ];
}
