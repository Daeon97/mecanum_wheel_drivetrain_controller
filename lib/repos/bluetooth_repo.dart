// ignore_for_file: public_member_api_docs

import 'package:flutter_blue/flutter_blue.dart' as f_b;
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart'
    as f_b_s;

class BluetoothRepo {
  BluetoothRepo()
      : _flutterBluetoothSerial = f_b_s.FlutterBluetoothSerial.instance,
        _flutterBlue = f_b.FlutterBlue.instance;

  final f_b_s.FlutterBluetoothSerial _flutterBluetoothSerial;
  final f_b.FlutterBlue _flutterBlue;

  Future<bool> get isBluetoothAvailable => _flutterBlue.isAvailable;

  Future<bool> get isBluetoothOn => _flutterBlue.isOn;

  Future<bool?> turnBluetoothOn() => _flutterBluetoothSerial.requestEnable();

  Future<bool?> turnBluetoothOff() => _flutterBluetoothSerial.requestDisable();

  Future<void> openBluetoothSettings() =>
      _flutterBluetoothSerial.openSettings();

  Stream<f_b.BluetoothState> get bluetoothState => _flutterBlue.state;

// g() startScan

// Stream<f_b_s.BluetoothDiscoveryResult> get fbBluetoothDevices =>
//     _flutterBluetoothSerial.startDiscovery();

// Stream<f_b_s.BluetoothDiscoveryResult> get fbsBluetoothDevices =>
//     _flutterBluetoothSerial.startDiscovery();
}