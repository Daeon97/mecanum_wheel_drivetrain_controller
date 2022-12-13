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

class ListenBluetoothDevicesEvent extends BluetoothEvent {
  const ListenBluetoothDevicesEvent();

  @override
  List<Object?> get props => [];
}

class FoundBluetoothDevicesEvent extends BluetoothEvent {
  const FoundBluetoothDevicesEvent(
    this.bluetoothDevices,
  );

  final List<models.BluetoothDevice> bluetoothDevices;

  @override
  List<Object?> get props => [
        bluetoothDevices,
      ];
}

class InitiateBluetoothPairingRequestEvent extends BluetoothEvent {
  const InitiateBluetoothPairingRequestEvent(
    this.bluetoothDevice,
  );

  final models.BluetoothDevice bluetoothDevice;

  @override
  List<Object?> get props => [
        bluetoothDevice,
      ];
}

class StopListeningBluetoothDevicesAndStateEvent extends BluetoothEvent {
  const StopListeningBluetoothDevicesAndStateEvent();

  @override
  List<Object?> get props => [];
}
