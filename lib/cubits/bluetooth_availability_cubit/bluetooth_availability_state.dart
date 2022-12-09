// ignore_for_file: public_member_api_docs

part of 'bluetooth_availability_cubit.dart';

abstract class BluetoothAvailabilityState extends Equatable {
  const BluetoothAvailabilityState();

  @override
  List<Object?> get props => [];
}

class BluetoothAvailabilityInitialState extends BluetoothAvailabilityState {
  const BluetoothAvailabilityInitialState();

  @override
  List<Object?> get props => [];
}

class BluetoothAvailableState extends BluetoothAvailabilityState {
  const BluetoothAvailableState();

  @override
  List<Object?> get props => [];
}

class BluetoothNotAvailableState extends BluetoothAvailabilityState {
  const BluetoothNotAvailableState(
    this.message,
  );

  final String message;

  @override
  List<Object?> get props => [
        message,
      ];
}
