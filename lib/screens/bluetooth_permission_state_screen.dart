// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mecanum_wheel_drivetrain_controller/cubits/cubits.dart';
import 'package:mecanum_wheel_drivetrain_controller/utils/utils.dart';
import 'package:rive/rive.dart';

class BluetoothPermissionStateScreen extends StatefulWidget {
  const BluetoothPermissionStateScreen({super.key});

  @override
  State<BluetoothPermissionStateScreen> createState() =>
      _BluetoothPermissionStateScreenState();
}

class _BluetoothPermissionStateScreenState
    extends State<BluetoothPermissionStateScreen> {
  late SimpleAnimation _bluetoothAnimationController;

  @override
  void initState() {
    _bluetoothAnimationController = SimpleAnimation(
      bluetoothAnimationName,
      autoplay: false,
    );
    BlocProvider.of<PermissionsCubit>(context).requestPermission(
      PermissionType.bluetoothConnect,
    );
    super.initState();
  }

  @override
  void deactivate() {
    //.
    super.deactivate();
  }

  @override
  void dispose() {
    _bluetoothAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      BlocListener<PermissionsCubit, PermissionsState>(
        listener: (_, permissionsState) {
          if (permissionsState is PermissionGrantedState) {
            if (permissionsState.permissionType ==
                PermissionType.bluetoothConnect) {
              BlocProvider.of<PermissionsCubit>(context).requestPermission(
                PermissionType.bluetoothScan,
              );
            }
          }
        },
        child: Scaffold(
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(
                padding,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: threeHundred,
                    height: threeHundred,
                    child: RiveAnimation.asset(
                      bluetoothAnimationRiveAsset,
                      controllers: [
                        _bluetoothAnimationController,
                      ],
                    ),
                  ),
                  BlocBuilder<PermissionsCubit, PermissionsState>(
                    builder: (_, permissionsState) => permissionsState
                                is RequestingPermissionState &&
                            (permissionsState.permissionType ==
                                    PermissionType.bluetoothConnect ||
                                permissionsState.permissionType ==
                                    PermissionType.bluetoothScan) &&
                            permissionsState.message != null
                        ? Text(
                            permissionsState.message!,
                            textAlign: TextAlign.center,
                          )
                        : permissionsState is PermissionDeniedState &&
                                (permissionsState.permissionType ==
                                        PermissionType.bluetoothConnect ||
                                    permissionsState.permissionType ==
                                        PermissionType.bluetoothScan)
                            ? Text(
                                permissionsState.message,
                                textAlign: TextAlign.center,
                              )
                            : permissionsState
                                        is PermissionCannotBeRequestedState &&
                                    (permissionsState.permissionType ==
                                            PermissionType.bluetoothConnect ||
                                        permissionsState.permissionType ==
                                            PermissionType.bluetoothScan)
                                ? Text(
                                    permissionsState.message,
                                    textAlign: TextAlign.center,
                                  )
                                : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
