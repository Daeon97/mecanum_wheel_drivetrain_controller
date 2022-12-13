// ignore_for_file: public_member_api_docs

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

  Future<bool> get isBluetoothOn => _flutterBlue.isOn; // not used

  Future<bool?> turnBluetoothOn() => _flutterBluetoothSerial.requestEnable();

  Future<bool?> turnBluetoothOff() =>
      _flutterBluetoothSerial.requestDisable(); // not used

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

  Future<f_b_s.BluetoothConnection> connectToBluetoothDevice(
    String address,
  ) =>
      f_b_s.BluetoothConnection.toAddress(address);

  Future<List<f_b_s.BluetoothDevice>> get pairedBluetoothDevices =>
      _flutterBluetoothSerial.getBondedDevices();
}
