// ignore_for_file: public_member_api_docs

part of 'bluetooth_permission_cubit.dart';

abstract class BluetoothPermissionState extends Equatable {
  const BluetoothPermissionState();

  @override
  List<Object?> get props => [];
}

class BluetoothPermissionInitialState extends BluetoothPermissionState {
  const BluetoothPermissionInitialState();

  @override
  List<Object?> get props => [];
}

class RequestingBluetoothPermissionState extends BluetoothPermissionState {
  const RequestingBluetoothPermissionState(
    this.message,
  );

  final String message;

  @override
  List<Object?> get props => [
        message,
      ];
}

class BluetoothPermissionGrantedState extends BluetoothPermissionState {
  const BluetoothPermissionGrantedState(
    this.bluetoothPermissionType,
  );

  final BluetoothPermissionType bluetoothPermissionType;

  @override
  List<Object?> get props => [
        bluetoothPermissionType,
      ];
}

class BluetoothPermissionDeniedState extends BluetoothPermissionState {
  const BluetoothPermissionDeniedState(
    this.bluetoothPermissionType,
    this.message,
  );

  final BluetoothPermissionType bluetoothPermissionType;
  final String message;

  @override
  List<Object?> get props => [
        bluetoothPermissionType,
        message,
      ];
}

class BluetoothPermissionCannotBeRequestedState
    extends BluetoothPermissionState {
  const BluetoothPermissionCannotBeRequestedState(
    this.bluetoothPermissionType,
    this.message,
  );

  final BluetoothPermissionType bluetoothPermissionType;
  final String message;

  @override
  List<Object?> get props => [
        bluetoothPermissionType,
        message,
      ];
}
