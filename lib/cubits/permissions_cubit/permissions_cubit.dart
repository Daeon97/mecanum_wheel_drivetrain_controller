// ignore_for_file: public_member_api_docs

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mecanum_wheel_drivetrain_controller/repos/repos.dart';
import 'package:mecanum_wheel_drivetrain_controller/utils/utils.dart';
import 'package:permission_handler/permission_handler.dart';

part 'permissions_state.dart';

class PermissionsCubit extends Cubit<PermissionsState> {
  PermissionsCubit(
    this._permissionsRepo,
  ) : super(
          const PermissionsInitialState(),
        );

  final PermissionsRepo _permissionsRepo;

  Future<void> requestPermission(
    PermissionType permissionType,
  ) async {
    emit(
      RequestingPermissionState(
        permissionType,
        permissionType == PermissionType.bluetoothConnect ||
                permissionType == PermissionType.bluetoothScan
            ? waitingForBluetoothPermissionText
            : null,
      ),
    );
    switch (permissionType) {
      case PermissionType.bluetoothConnect:
        final permissionStatus =
            await _permissionsRepo.requestBluetoothConnectPermission;
        if (permissionStatus.isGranted) {
          emit(
            PermissionGrantedState(
              permissionType,
            ),
          );
        } else if (permissionStatus.isDenied) {
          emit(
            PermissionDeniedState(
              permissionType,
              bluetoothConnectPermissionDeniedMessageText,
            ),
          );
        } else {
          emit(
            PermissionCannotBeRequestedState(
              permissionType,
              bluetoothConnectPermissionCannotBeRequestedMessageText,
            ),
          );
        }
        break;
      case PermissionType.bluetoothScan:
        final permissionStatus =
            await _permissionsRepo.requestBluetoothScanPermission;
        if (permissionStatus.isGranted) {
          emit(
            PermissionGrantedState(
              permissionType,
            ),
          );
        } else if (permissionStatus.isDenied) {
          emit(
            PermissionDeniedState(
              permissionType,
              bluetoothScanPermissionDeniedMessageText,
            ),
          );
        } else {
          emit(
            PermissionCannotBeRequestedState(
              permissionType,
              bluetoothScanPermissionCannotBeRequestedMessageText,
            ),
          );
        }
        break;
    }
  }
}
