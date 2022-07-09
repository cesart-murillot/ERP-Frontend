import 'package:equatable/equatable.dart';

enum States { initial, loading, loaded, error }

class RequestKeyState extends Equatable {
  final States state;
  final int? totalTransfers;
  final int? verifiedTransfers;
  final int? pendingTransfers;
  final String? errorMessage;

  RequestKeyState init() {
    return const RequestKeyState();
  }

  RequestKeyState clone() {
    return const RequestKeyState();
  }

  RequestKeyState error({required String errorMessage}) {
    return RequestKeyState(
      state: States.error,
      errorMessage: errorMessage,
    );
  }

  RequestKeyState loadedData({
    required States state,
    int? totalTransfers,
    int? verifiedTransfers,
    int? pendingTransfers,
  }) {
    return RequestKeyState(
      state: state,
      totalTransfers: totalTransfers ?? this.totalTransfers,
      verifiedTransfers: verifiedTransfers ?? this.verifiedTransfers,
      pendingTransfers: pendingTransfers ?? this.pendingTransfers,
    );
  }

  @override
  List<Object?> get props => [
        state,
        totalTransfers,
        verifiedTransfers,
        pendingTransfers,
        errorMessage,
      ];

  const RequestKeyState({
    this.state = States.initial,
    this.totalTransfers,
    this.verifiedTransfers,
    this.pendingTransfers,
    this.errorMessage,
  });
}
