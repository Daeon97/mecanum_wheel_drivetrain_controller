// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';

part 'bluetooth_device.freezed.dart';

part 'bluetooth_device.g.dart';

@freezed
class BluetoothDevice with _$BluetoothDevice {
  const factory BluetoothDevice({
    required String address,
    required String? name,
    required bool paired,
    required bool connected,
  }) = _BluetoothDevice;

  factory BluetoothDevice.fromJson(Map<String, Object?> json) =>
      _$BluetoothDeviceFromJson(json);
}
