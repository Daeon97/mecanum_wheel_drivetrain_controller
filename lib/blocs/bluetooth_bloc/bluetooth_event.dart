// ignore_for_file: public_member_api_docs

part of 'bluetooth_bloc.dart';

abstract class BluetoothEvent extends Equatable {
  const BluetoothEvent();

  @override
  List<Object?> get props => [];
}

class TurnBluetoothOnEvent extends BluetoothEvent {
  const TurnBluetoothOnEvent();

  @override
  List<Object?> get props => [];
}

class BluetoothOffEvent extends BluetoothEvent {
  const BluetoothOffEvent(
    this.message,
  );

  final String message;

  @override
  List<Object?> get props => [];
}

class ListenBluetoothStateEvent extends BluetoothEvent {
  const ListenBluetoothStateEvent();

  @override
  List<Object?> get props => [];
}

class StopListeningBluetoothStateEvent extends BluetoothEvent {
  const StopListeningBluetoothStateEvent();

  @override
  List<Object?> get props => [];
}
