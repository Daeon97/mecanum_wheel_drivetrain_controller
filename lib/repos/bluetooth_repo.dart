// ignore_for_file: public_member_api_docs

import 'dart:convert';

import 'package:flutter_blue/flutter_blue.dart' as f_b;
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart'
    as f_b_s;
import 'package:mecanum_wheel_drivetrain_controller/utils/utils.dart';

class BluetoothRepo {
  BluetoothRepo()
      : _flutterBluetoothSerial = f_b_s.FlutterBluetoothSerial.instance,
        _flutterBlue = f_b.FlutterBlue.instance;

  final f_b_s.FlutterBluetoothSerial _flutterBluetoothSerial;
  final f_b.FlutterBlue _flutterBlue;

  Future<bool> get isBluetoothAvailable => _flutterBlue.isAvailable;

  Future<bool?> turnBluetoothOn() => _flutterBluetoothSerial.requestEnable();

  Future<void> openBluetoothSettings() =>
      _flutterBluetoothSerial.openSettings();

  Stream<f_b.BluetoothState> get bluetoothState => _flutterBlue.state;

  Stream<f_b_s.BluetoothDiscoveryResult> get bluetoothDevices =>
      _flutterBluetoothSerial.startDiscovery();

  BluetoothDeviceType computeBluetoothDeviceType(
    f_b_s.BluetoothDevice bluetoothDevice,
  ) {
    late BluetoothDeviceType bluetoothDeviceType;
    if (bluetoothDevice.type == f_b_s.BluetoothDeviceType.classic) {
      bluetoothDeviceType = BluetoothDeviceType.classic;
    } else if (bluetoothDevice.type == f_b_s.BluetoothDeviceType.le) {
      bluetoothDeviceType = BluetoothDeviceType.lowEnergy;
    } else if (bluetoothDevice.type == f_b_s.BluetoothDeviceType.dual) {
      bluetoothDeviceType = BluetoothDeviceType.dual;
    } else {
      bluetoothDeviceType = BluetoothDeviceType.unknown;
    }
    return bluetoothDeviceType;
  }

  Future<bool?> pairBluetoothDevice(
    String address,
  ) =>
      _flutterBluetoothSerial.bondDeviceAtAddress(
        address,
      );

  Future<bool?> unpairBluetoothDevice(
    String address,
  ) =>
      _flutterBluetoothSerial.removeDeviceBondWithAddress(
        address,
      );

  Future<f_b_s.BluetoothConnection> connectToBluetoothDevice(
    String address,
  ) =>
      f_b_s.BluetoothConnection.toAddress(
        address,
      );

  Future<void> disconnectFromBluetoothDevice(
    f_b_s.BluetoothConnection bluetoothConnection, {
    bool gracefully = true,
  }) =>
      gracefully ? bluetoothConnection.finish() : bluetoothConnection.close();

  Future<List<f_b_s.BluetoothDevice>> get pairedBluetoothDevices =>
      _flutterBluetoothSerial.getBondedDevices();

  void sendDataToBluetoothDevice(
    f_b_s.BluetoothConnection bluetoothConnection, {
    required String data,
  }) =>
      bluetoothConnection.output.add(
        ascii.encode(data),
      );
}
