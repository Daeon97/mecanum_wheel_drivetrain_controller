// ignore_for_file: public_member_api_docs

part of 'bluetooth_bloc.dart';

abstract class BluetoothState extends Equatable {
  const BluetoothState();

  @override
  List<Object?> get props => [];
}

class BluetoothInitialState extends BluetoothState {
  const BluetoothInitialState();

  @override
  List<Object?> get props => [];
}

class BluetoothOffState extends BluetoothState {
  const BluetoothOffState(
    this.message,
  );

  final String message;

  @override
  List<Object?> get props => [
        message,
      ];
}
