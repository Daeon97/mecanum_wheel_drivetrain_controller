// ignore_for_file: public_member_api_docs

import 'package:permission_handler/permission_handler.dart';

class PermissionsRepo {
  const PermissionsRepo();

  Future<PermissionStatus> get requestBluetoothScanPermission =>
      Permission.bluetoothScan.request();

  Future<PermissionStatus> get bluetoothScanPermissionStatus =>
      Permission.bluetoothScan.status;

  Permission get bluetoothScanPermission => Permission.bluetoothScan;

  Future<PermissionStatus> get requestBluetoothConnectPermission =>
      Permission.bluetoothConnect.request();

  Future<PermissionStatus> get bluetoothConnectPermissionStatus =>
      Permission.bluetoothConnect.status;

  Permission get bluetoothConnectPermission => Permission.bluetoothConnect;

  Future<Map<Permission, PermissionStatus>>
      get requestBluetoothScanAndConnectPermissions => [
            Permission.bluetoothScan,
            Permission.bluetoothConnect,
          ].request();
}
