// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

const defaultScreenRoute = '/';
const pairedBluetoothDevicesScreenRoute = '/pairedBluetoothDevicesScreen';
const bluetoothOpsScreenRoute = '/bluetoothOpsScreen';
const controllerScreenRoute = '/controllerScreen';
const selectConnectionScreenRoute = '/selectConnection';
const wifiOpsScreenRoute = '/wifiOpsScreen';

const baseColor = Colors.white;

final white15 = Colors.white.withOpacity(0.15);
final white24 = Colors.white.withOpacity(0.24);
final white34 = Colors.white.withOpacity(0.34);
final white74 = Colors.white.withOpacity(0.74);

const green = Color(0xFF00FF38);

const extraLargePadding = 128.0;
const veryLargePadding = 64.0;
const largePadding = 32.0;
const padding = 16.0;
const smallPadding = 8.0;
const tinyPadding = 2.0;
const veryTinyPadding = 1.0;
const nil = 0.0;

const nilDotThree = 0.3;
const nilDotSeven = 0.7;
const nilDotSevenFive = 0.75;

const oneFiftySevenDotSevenFive = 157.75;

const twoHundredDotNil = 200.0;

const bluetoothAnimationRiveAsset = 'assets/bluetooth.riv';
const bluetoothAnimationName = 'scan';

const canGoNextAnimationRiveAsset = 'assets/can_go_next.riv';
const canGoNextAnimationName = 'Can Go Next Animation';

const connectionModeButtonAnimationRiveAsset =
    'assets/connection_mode_button_animation.riv';
const connectionModeButtonAnimationStateMachineName = 'State Machine 1';
const modeSMIInputForConnectionModeButtonAnimationStateMachine = 'Mode';
const selectedSMIInputForConnectionModeButtonAnimationStateMachine = 'Selected';

const bluetoothScanPermissionDeniedMessageText =
    'The bluetooth scan permission is required to be able to discover and pair nearby Bluetooth devices. Please grant the permission to proceed';
const bluetoothConnectPermissionDeniedMessageText =
    'The bluetooth connect permission is required to be able to connect to paired Bluetooth devices. Please grant the permission to proceed';
const waitingForBluetoothScanAndConnectPermissionsText =
    'Waiting for bluetooth scan and connect permissions';
const bluetoothScanAndConnectPermissionsDeniedMessageText =
    'The bluetooth scan and connect permissions are required to be able to discover, connect to and pair nearby Bluetooth devices. Please grant these permissions to proceed';
const bluetoothScanAndConnectPermissionsCannotBeRequestedMessageText =
    'Something is preventing us from requesting the bluetooth scan and connect permissions. You will have to enable these permissions manually in settings';
const bluetoothNotAvailableMessageText =
    'Bluetooth hardware is not available on this device';
const bluetoothOffMessageText = 'Bluetooth is currently turned off';
const slashText = '/';
const turnOnBluetoothText = 'Turn On Bluetooth';
const requestPermissionAgainText = 'Request Permission Again';
const openAppSettings = 'Open App Settings';
const leaveHereText = 'Leave Here';
const wifiText = 'WIFI';
const bluetoothText = 'Bluetooth';
const tapSelectedAgainToProceedText = 'Tap selected again to proceed';
const selectModeText = 'Select Mode';
const scanningForAvailableDevicesText = 'Scanning for available devices';
const connectedText = 'Connected';
const notConnectedText = 'Not Connected';
const pairedText = 'Paired';
const notPairedText = 'Not Paired';
const commaText = ',';
const failedToPairBluetoothDeviceText = 'Failed to pair bluetooth device';
const failedToConnectToBluetoothDeviceText =
    'Failed to connect to bluetooth device';
const nextStepText = 'Next Step';
const connectionModeUnsupportedText =
    'This connection mode is not supported at this time';
