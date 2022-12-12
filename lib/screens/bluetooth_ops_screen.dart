// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mecanum_wheel_drivetrain_controller/blocs/blocs.dart';
import 'package:mecanum_wheel_drivetrain_controller/cubits/cubits.dart';
import 'package:mecanum_wheel_drivetrain_controller/utils/utils.dart';
import 'package:rive/rive.dart';

class BluetoothOpsScreen extends StatefulWidget {
  const BluetoothOpsScreen({super.key});

  @override
  State<BluetoothOpsScreen> createState() => _BluetoothOpsScreenState();
}

class _BluetoothOpsScreenState extends State<BluetoothOpsScreen> {
  late SimpleAnimation _bluetoothAnimationController;

  @override
  void initState() {
    _bluetoothAnimationController = SimpleAnimation(
      bluetoothAnimationName,
    );
    BlocProvider.of<BluetoothAvailabilityCubit>(context)
        .checkBluetoothAvailability();
    super.initState();
  }

  @override
  void deactivate() {
    BlocProvider.of<BluetoothBloc>(context).add(
      const StopListeningBluetoothDevicesAndStateEvent(),
    );
    super.deactivate();
  }

  @override
  void dispose() {
    _bluetoothAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      BlocListener<BluetoothAvailabilityCubit, BluetoothAvailabilityState>(
        listener: (_, bluetoothAvailabilityState) {
          if (bluetoothAvailabilityState is BluetoothAvailableState) {
            BlocProvider.of<BluetoothPermissionCubit>(context)
                .requestPermission(
              BluetoothPermissionType.bluetoothScanAndConnect,
            );
          }
        },
        child: BlocListener<BluetoothPermissionCubit, BluetoothPermissionState>(
          listener: (_, bluetoothPermissionState) {
            if (bluetoothPermissionState is BluetoothPermissionGrantedState &&
                bluetoothPermissionState.bluetoothPermissionType ==
                    BluetoothPermissionType.bluetoothScanAndConnect) {
              BlocProvider.of<BluetoothBloc>(context).add(
                const ListenBluetoothStateEvent(),
              );
            }
          },
          child: Scaffold(
            body: BlocBuilder<BluetoothAvailabilityCubit,
                BluetoothAvailabilityState>(
              builder: (
                _,
                bluetoothAvailabilityState,
              ) =>
                  bluetoothAvailabilityState is BluetoothNotAvailableState
                      ? Center(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(
                              padding,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: const [
                                    Icon(
                                      FontAwesomeIcons.bluetooth,
                                      color: Colors.grey,
                                      size: veryLargePadding + largePadding,
                                    ),
                                    Text(
                                      slashText,
                                      style: TextStyle(
                                        fontSize:
                                            extraLargePadding + largePadding,
                                        fontWeight: FontWeight.w100,
                                        color: Colors.black38,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  bluetoothAvailabilityState.message,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: largePadding,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacementNamed(
                                      selectConnectionScreenRoute,
                                    );
                                  },
                                  child: const Text(
                                    leaveHereText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : BlocBuilder<BluetoothPermissionCubit,
                          BluetoothPermissionState>(
                          builder: (
                            bluetoothPermissionCtx,
                            bluetoothPermissionState,
                          ) =>
                              bluetoothPermissionState
                                      is RequestingBluetoothPermissionState
                                  ? Center(
                                      child: SingleChildScrollView(
                                        padding: const EdgeInsets.all(
                                          padding,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              FontAwesomeIcons.bluetooth,
                                              color: baseColor,
                                              size: veryLargePadding +
                                                  largePadding,
                                            ),
                                            const SizedBox(
                                              height: largePadding,
                                            ),
                                            Text(
                                              bluetoothPermissionState.message,
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : bluetoothPermissionState
                                          is BluetoothPermissionDeniedState
                                      ? Center(
                                          child: SingleChildScrollView(
                                            padding: const EdgeInsets.all(
                                              padding,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  FontAwesomeIcons.bluetooth,
                                                  color: Colors.grey,
                                                  size: veryLargePadding +
                                                      largePadding,
                                                ),
                                                const SizedBox(
                                                  height: largePadding,
                                                ),
                                                Text(
                                                  bluetoothPermissionState
                                                      .message,
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(
                                                  height: largePadding,
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    bluetoothPermissionCtx
                                                        .read<
                                                            BluetoothPermissionCubit>()
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
                                            ),
                                          ),
                                        )
                                      : bluetoothPermissionState
                                              is BluetoothPermissionCannotBeRequestedState
                                          ? Center(
                                              child: SingleChildScrollView(
                                                padding: const EdgeInsets.all(
                                                  padding,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Icon(
                                                      FontAwesomeIcons
                                                          .bluetooth,
                                                      color: Colors.grey,
                                                      size: veryLargePadding +
                                                          largePadding,
                                                    ),
                                                    const SizedBox(
                                                      height: largePadding,
                                                    ),
                                                    Text(
                                                      bluetoothPermissionState
                                                          .message,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    const SizedBox(
                                                      height: largePadding,
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        BlocProvider.of<
                                                            ActionsCubit>(
                                                          context,
                                                        ).openAppSettings();
                                                      },
                                                      child: const Text(
                                                        openAppSettings,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          : BlocBuilder<BluetoothBloc,
                                              BluetoothState>(
                                              builder: (
                                                bluetoothCtx,
                                                bluetoothState,
                                              ) =>
                                                  bluetoothState
                                                          is BluetoothOffState
                                                      ? Center(
                                                          child:
                                                              SingleChildScrollView(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(
                                                              padding,
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                const Icon(
                                                                  FontAwesomeIcons
                                                                      .bluetooth,
                                                                  color: Colors
                                                                      .grey,
                                                                  size: veryLargePadding +
                                                                      largePadding,
                                                                ),
                                                                const SizedBox(
                                                                  height:
                                                                      largePadding,
                                                                ),
                                                                Text(
                                                                  bluetoothState
                                                                      .message,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                const SizedBox(
                                                                  height:
                                                                      largePadding,
                                                                ),
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    bluetoothCtx
                                                                        .read<
                                                                            BluetoothBloc>()
                                                                        .add(
                                                                          const TurnBluetoothOnEvent(),
                                                                        );
                                                                  },
                                                                  child:
                                                                      const Text(
                                                                    turnOnBluetoothText,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      : bluetoothState
                                                              is FoundBluetoothDevicesState
                                                          ? Column(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                    left:
                                                                        padding,
                                                                  ),
                                                                  child: Row(
                                                                    children: const [
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          scanningForAvailableDevicesText,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            extraLargePadding,
                                                                        height:
                                                                            extraLargePadding,
                                                                        child: RiveAnimation
                                                                            .asset(
                                                                          bluetoothAnimationRiveAsset,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: ListView
                                                                      .builder(
                                                                    itemCount: bluetoothState
                                                                        .bluetoothDevices
                                                                        .length,
                                                                    itemBuilder:
                                                                        (_, index) =>
                                                                            ListTile(
                                                                      title:
                                                                          Text(
                                                                        bluetoothState.bluetoothDevices[index].name ??
                                                                            bluetoothState.bluetoothDevices[index].address,
                                                                      ),
                                                                      subtitle:
                                                                          Text(
                                                                        '${bluetoothState.bluetoothDevices[index].paired ? pairedText : notPairedText}${commaText} ${bluetoothState.bluetoothDevices[index].connected ? connectedText : notConnectedText}',
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          : const SizedBox
                                                              .shrink(),
                                            ),
                        ),
            ),
          ),
        ),
      );
}
