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
      const RequestingBluetoothPermissionState(
        waitingForBluetoothScanAndConnectPermissionsText,
      ),
    );
    switch (bluetoothPermissionType) {
      case BluetoothPermissionType.bluetoothScanAndConnect:
        final result =
            await _permissionsRepo.requestBluetoothScanAndConnectPermissions;

        final bluetoothScanPermissionStatus =
            result[_permissionsRepo.bluetoothScanPermission]!;
        final bluetoothConnectPermissionStatus =
            result[_permissionsRepo.bluetoothConnectPermission]!;

        if (bluetoothScanPermissionStatus.isGranted &&
            bluetoothConnectPermissionStatus.isGranted) {
          emit(
            BluetoothPermissionGrantedState(
              bluetoothPermissionType,
            ),
          );
        } else if (bluetoothScanPermissionStatus.isDenied &&
            bluetoothConnectPermissionStatus.isDenied) {
          emit(
            BluetoothPermissionDeniedState(
              bluetoothPermissionType,
              bluetoothScanAndConnectPermissionsDeniedMessageText,
            ),
          );
        } else {
          if (bluetoothScanPermissionStatus.isGranted &&
              bluetoothConnectPermissionStatus.isDenied) {
            emit(
              BluetoothPermissionDeniedState(
                bluetoothPermissionType,
                bluetoothConnectPermissionDeniedMessageText,
              ),
            );
          } else if (bluetoothConnectPermissionStatus.isGranted &&
              bluetoothScanPermissionStatus.isDenied) {
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
                bluetoothScanAndConnectPermissionsCannotBeRequestedMessageText,
              ),
            );
          }
        }
        break;
    }
  }
}
