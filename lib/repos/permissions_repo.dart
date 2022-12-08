// ignore_for_file: public_member_api_docs

import 'package:permission_handler/permission_handler.dart';

class PermissionsRepo {
  const PermissionsRepo();

  Future<PermissionStatus> get requestBluetoothConnectPermission =>
      Permission.bluetoothConnect.request();

  Future<PermissionStatus> get requestBluetoothScanPermission =>
      Permission.bluetoothScan.request();
}
