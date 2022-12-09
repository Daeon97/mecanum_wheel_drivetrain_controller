// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mecanum_wheel_drivetrain_controller/blocs/blocs.dart';
import 'package:mecanum_wheel_drivetrain_controller/cubits/cubits.dart';
import 'package:mecanum_wheel_drivetrain_controller/utils/utils.dart';
import 'package:rive/rive.dart';

class BluetoothStateScreen extends StatefulWidget {
  const BluetoothStateScreen({super.key});

  @override
  State<BluetoothStateScreen> createState() => _BluetoothStateScreenState();
}

class _BluetoothStateScreenState extends State<BluetoothStateScreen> {
  late SimpleAnimation _bluetoothAnimationController;

  @override
  void initState() {
    _bluetoothAnimationController = SimpleAnimation(
      bluetoothAnimationName,
    );
    BlocProvider.of<BluetoothPermissionCubit>(context).requestPermission(
      BluetoothPermissionType.bluetoothScan,
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

  // Stack(
  // alignment: AlignmentDirectional.center,
  // children: const [
  // Icon(
  // FontAwesomeIcons.bluetooth,
  // color: Colors.grey,
  // size: veryLargePadding + largePadding,
  // ),
  // Text(
  // slashText,
  // style: TextStyle(
  // fontSize:
  // extraLargePadding + largePadding,
  // fontWeight: FontWeight.w100,
  // color: Colors.black38,
  // ),
  // ),
  // ],
  // ),

  @override
  Widget build(BuildContext context) =>
      BlocListener<BluetoothPermissionCubit, BluetoothPermissionState>(
        listener: (_, bluetoothPermissionState) {
          if (bluetoothPermissionState is BluetoothPermissionGrantedState) {
            if (bluetoothPermissionState.bluetoothPermissionType ==
                BluetoothPermissionType.bluetoothScan) {
              BlocProvider.of<BluetoothPermissionCubit>(context)
                  .requestPermission(
                BluetoothPermissionType.bluetoothConnect,
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
              child: BlocBuilder<BluetoothPermissionCubit,
                  BluetoothPermissionState>(
                builder: (bluetoothPermissionCtx, bluetoothPermissionState) =>
                    bluetoothPermissionState
                            is RequestingBluetoothPermissionState
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                FontAwesomeIcons.bluetooth,
                                color: baseColor,
                                size: veryLargePadding + largePadding,
                              ),
                              const SizedBox(
                                height: largePadding,
                              ),
                              Text(
                                bluetoothPermissionState.message,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                        : bluetoothPermissionState
                                is BluetoothPermissionDeniedState
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.bluetooth,
                                    color: Colors.grey,
                                    size: veryLargePadding + largePadding,
                                  ),
                                  const SizedBox(
                                    height: largePadding,
                                  ),
                                  Text(
                                    bluetoothPermissionState.message,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: largePadding,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      bluetoothPermissionCtx
                                          .read<BluetoothPermissionCubit>()
                                          .requestPermission(
                                            bluetoothPermissionState
                                                .bluetoothPermissionType,
                                          );
                                    },
                                    child: const Text(
                                      requestPermissionAgainText,
                                    ),
                                  ),
                                ],
                              )
                            : bluetoothPermissionState
                                    is BluetoothPermissionCannotBeRequestedState
                                ? Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        FontAwesomeIcons.bluetooth,
                                        color: Colors.grey,
                                        size: veryLargePadding + largePadding,
                                      ),
                                      const SizedBox(
                                        height: largePadding,
                                      ),
                                      Text(
                                        bluetoothPermissionState.message,
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(
                                        height: largePadding,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          BlocProvider.of<ActionsCubit>(
                                            context,
                                          ).openAppSettings();
                                        },
                                        child: const Text(
                                          openAppSettings,
                                        ),
                                      ),
                                    ],
                                  )
                                : const SizedBox.shrink(),
              ),
            ),
          ),
        ),
      );
}
