// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:mecanum_wheel_drivetrain_controller/utils/utils.dart';

class SelectConnectionScreen extends StatefulWidget {
  const SelectConnectionScreen({super.key});

  @override
  State<SelectConnectionScreen> createState() => _SelectConnectionScreenState();
}

class _SelectConnectionScreenState extends State<SelectConnectionScreen> {
  late ValueNotifier<ConnectionMode?> _connectionMode;
  bool _shouldShowInfo = true;

  @override
  void initState() {
    _connectionMode = ValueNotifier<ConnectionMode?>(
      null,
    );
    super.initState();
  }

  @override
  void dispose() {
    _connectionMode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(
              padding,
            ),
            child: ValueListenableBuilder<ConnectionMode?>(
              valueListenable: _connectionMode,
              builder: (_, connectionModeValue, __) => Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(
                      veryLargePadding,
                    ),
                    onTap: () {
                      if (connectionModeValue != ConnectionMode.wifi) {
                        _connectionMode.value = ConnectionMode.wifi;
                        if (_shouldShowInfo) {
                          showTopSnackbar(
                            context,
                            tapSelectedAgainToProceedText,
                          );
                          _shouldShowInfo = false;
                        }
                      } else {
                        print('wifi tapped again');
                      }
                    },
                    child: AnimatedContainer(
                      duration: Duration(
                        milliseconds: threeHundredDotNil.toInt(),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: padding,
                        vertical: smallPadding,
                      ),
                      decoration: BoxDecoration(
                        color: connectionModeValue == ConnectionMode.wifi
                            ? baseColor
                            : null,
                        border: connectionModeValue == ConnectionMode.wifi
                            ? null
                            : Border.all(
                                color: Colors.grey,
                              ),
                        borderRadius: BorderRadius.circular(
                          veryLargePadding,
                        ),
                      ),
                      child: AnimatedSize(
                        duration: Duration(
                          milliseconds: threeHundredDotNil.toInt(),
                        ),
                        child: AnimatedSwitcher(
                          duration: Duration(
                            milliseconds: threeHundredDotNil.toInt(),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.wifi,
                                color:
                                    connectionModeValue == ConnectionMode.wifi
                                        ? Colors.white
                                        : Colors.grey,
                                size: connectionModeValue == ConnectionMode.wifi
                                    ? veryLargePadding
                                    : veryLargePadding - smallPadding,
                              ),
                              if (connectionModeValue == ConnectionMode.wifi)
                                const SizedBox(
                                  width: padding,
                                )
                              else
                                const SizedBox.shrink(),
                              if (connectionModeValue == ConnectionMode.wifi)
                                const Text(
                                  wifiText,
                                  style: TextStyle(
                                    fontSize: largePadding,
                                    color: Colors.white,
                                  ),
                                )
                              else
                                const SizedBox.shrink(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: veryLargePadding,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(
                      veryLargePadding,
                    ),
                    onTap: () {
                      if (connectionModeValue != ConnectionMode.bluetooth) {
                        _connectionMode.value = ConnectionMode.bluetooth;
                        if (_shouldShowInfo) {
                          showTopSnackbar(
                            context,
                            tapSelectedAgainToProceedText,
                          );
                          _shouldShowInfo = false;
                        }
                      } else {
                        Navigator.of(context).pushReplacementNamed(
                          bluetoothOpsScreenRoute,
                        );
                      }
                    },
                    child: AnimatedContainer(
                      duration: Duration(
                        milliseconds: threeHundredDotNil.toInt(),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: padding,
                        vertical: smallPadding,
                      ),
                      decoration: BoxDecoration(
                        color: connectionModeValue == ConnectionMode.bluetooth
                            ? baseColor
                            : null,
                        border: connectionModeValue == ConnectionMode.bluetooth
                            ? null
                            : Border.all(
                                color: Colors.grey,
                              ),
                        borderRadius: BorderRadius.circular(
                          veryLargePadding,
                        ),
                      ),
                      child: AnimatedSize(
                        duration: Duration(
                          milliseconds: threeHundredDotNil.toInt(),
                        ),
                        child: AnimatedSwitcher(
                          duration: Duration(
                            milliseconds: threeHundredDotNil.toInt(),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.bluetooth,
                                color: connectionModeValue ==
                                        ConnectionMode.bluetooth
                                    ? Colors.white
                                    : Colors.grey,
                                size: connectionModeValue ==
                                        ConnectionMode.bluetooth
                                    ? veryLargePadding
                                    : veryLargePadding - smallPadding,
                              ),
                              if (connectionModeValue ==
                                  ConnectionMode.bluetooth)
                                const SizedBox(
                                  width: nil,
                                )
                              else
                                const SizedBox.shrink(),
                              if (connectionModeValue ==
                                  ConnectionMode.bluetooth)
                                const Text(
                                  bluetoothText,
                                  style: TextStyle(
                                    fontSize: largePadding,
                                    color: Colors.white,
                                  ),
                                )
                              else
                                const SizedBox.shrink(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
