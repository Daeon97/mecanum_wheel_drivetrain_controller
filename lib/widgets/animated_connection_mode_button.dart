// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'package:mecanum_wheel_drivetrain_controller/utils/utils.dart';
import 'package:rive/rive.dart';

class AnimatedConnectionModeButton extends StatefulWidget {
  const AnimatedConnectionModeButton({
    required this.mode,
    required this.isTapped,
    required this.onTap,
    super.key,
  });

  final ConnectionMode mode;
  final bool isTapped;
  final AnimatedConnectionModeButtonTapCallback onTap;

  @override
  State<AnimatedConnectionModeButton> createState() =>
      _AnimatedConnectionModeButtonState();
}

class _AnimatedConnectionModeButtonState
    extends State<AnimatedConnectionModeButton> {
  late StateMachineController _wifiStateMachineController;
  late StateMachineController _bluetoothStateMachineController;
  SMIInput<double>? _wifiSelectedSMIInput;
  SMIInput<double>? _bluetoothSelectedSMIInput;

  void _onWifiInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(
      artboard,
      connectionModeButtonAnimationStateMachineName,
    )!;
    artboard.addController(controller);
    controller
        .findInput<double>(
          modeSMIInputForConnectionModeButtonAnimationStateMachine,
        )
        ?.value = veryTinyPadding;
    _wifiSelectedSMIInput = controller.findInput<double>(
      selectedSMIInputForConnectionModeButtonAnimationStateMachine,
    );
  }

  void _onBluetoothInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(
      artboard,
      connectionModeButtonAnimationStateMachineName,
    )!;
    artboard.addController(controller);
    controller
        .findInput<double>(
          modeSMIInputForConnectionModeButtonAnimationStateMachine,
        )
        ?.value = tinyPadding;
    _bluetoothSelectedSMIInput = controller.findInput<double>(
      selectedSMIInputForConnectionModeButtonAnimationStateMachine,
    );
  }

  @override
  void dispose() {
    _wifiStateMachineController.dispose();
    _bluetoothStateMachineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.mode) {
      case ConnectionMode.wifi:
        _wifiSelectedSMIInput?.value = widget.isTapped ? veryTinyPadding : nil;
        break;
      case ConnectionMode.bluetooth:
        _bluetoothSelectedSMIInput?.value = widget.isTapped ? tinyPadding : nil;
        break;
    }

    return InkWell(
      customBorder: const CircleBorder(),
      onTap: widget.onTap,
      child: Stack(
        alignment: const Alignment(
          nil,
          nilDotSevenFive,
        ),
        children: [
          SizedBox(
            height: twoHundredDotNil,
            width: oneFiftySevenDotSevenFive,
            child: RiveAnimation.asset(
              connectionModeButtonAnimationRiveAsset,
              onInit: widget.mode == ConnectionMode.wifi
                  ? _onWifiInit
                  : _onBluetoothInit,
            ),
          ),
          Text(
            (widget.mode == ConnectionMode.wifi ? wifiText : bluetoothText)
                .toUpperCase(),
            style: TextStyle(
              color: widget.isTapped ? green : Theme.of(context).primaryColor,
              fontSize: padding,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
