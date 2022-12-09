// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mecanum_wheel_drivetrain_controller/repos/repos.dart';
import 'package:mecanum_wheel_drivetrain_controller/utils/utils.dart';
import 'package:permission_handler/permission_handler.dart';

part 'bluetooth_permission_state.dart';

class BluetoothPermissionCubit extends Cubit<BluetoothPermissionState> {
  BluetoothPermissionCubit(
    this._permissionsRepo,
  ) : super(
          const BluetoothPermissionInitialState(),
        );

  final PermissionsRepo _permissionsRepo;

  Future<void> requestPermission(
    BluetoothPermissionType bluetoothPermissionType,
  ) async {
    emit(
      RequestingBluetoothPermissionState(
        bluetoothPermissionType == BluetoothPermissionType.bluetoothScan
            ? waitingForBluetoothScanPermissionText
            : waitingForBluetoothConnectPermissionText,
      ),
    );
    switch (bluetoothPermissionType) {
      case BluetoothPermissionType.bluetoothScan:
        final permissionStatus =
            await _permissionsRepo.requestBluetoothScanPermission;
        if (permissionStatus.isGranted) {
          emit(
            BluetoothPermissionGrantedState(
              bluetoothPermissionType,
            ),
          );
        } else if (permissionStatus.isDenied) {
          emit(
            BluetoothPermissionDeniedState(
              bluetoothPermissionType,
              bluetoothScanPermissionDeniedMessageText,
            ),
          );
        } else {
          emit(
            BluetoothPermissionCannotBeRequestedState(
              bluetoothPermissionType,
              bluetoothScanPermissionCannotBeRequestedMessageText,
            ),
          );
        }
        break;
      case BluetoothPermissionType.bluetoothConnect:
        final permissionStatus =
            await _permissionsRepo.requestBluetoothConnectPermission;
        if (permissionStatus.isGranted) {
          emit(
            BluetoothPermissionGrantedState(
              bluetoothPermissionType,
            ),
          );
        } else if (permissionStatus.isDenied) {
          emit(
            BluetoothPermissionDeniedState(
              bluetoothPermissionType,
              bluetoothConnectPermissionDeniedMessageText,
            ),
          );
        } else {
          emit(
            BluetoothPermissionCannotBeRequestedState(
              bluetoothPermissionType,
              bluetoothConnectPermissionCannotBeRequestedMessageText,
            ),
          );
        }
        break;
    }
  }
}
