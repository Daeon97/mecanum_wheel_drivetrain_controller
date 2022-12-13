// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mecanum_wheel_drivetrain_controller/utils/utils.dart';

part 'bluetooth_device.freezed.dart';

part 'bluetooth_device.g.dart';

@freezed
class BluetoothDevice with _$BluetoothDevice {
  const factory BluetoothDevice({
    String? name,
    required String address,
    required BluetoothDeviceType bluetoothDeviceType,
    required bool paired,
    required bool connected,
  }) = _BluetoothDevice;

  factory BluetoothDevice.fromJson(Map<String, Object?> json) =>
      _$BluetoothDeviceFromJson(json);
}
