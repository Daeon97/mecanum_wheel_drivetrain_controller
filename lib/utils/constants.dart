// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

const defaultScreenRoute = '/';
const homeScreenRoute = '/homeScreen';
const bluetoothPermissionStateScreenRoute = '/bluetoothPermissionStateScreen';

const baseColor = Color(0xFF3309FD);

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

const threeHundred = 300.0;

const bluetoothAnimationRiveAsset = 'assets/bluetooth.riv';
const bluetoothAnimationName = 'scan';

const waitingForBluetoothPermissionText = 'Waiting for bluetooth permission';
const bluetoothConnectPermissionDeniedMessageText =
    'The bluetooth connect permission is required to be able to connect to paired Bluetooth devices. Please grant the permission to proceed';
const bluetoothConnectPermissionCannotBeRequestedMessageText =
    'Something is preventing us from requesting the bluetooth connect permission. You will have to enable the permission manually in settings';
const bluetoothScanPermissionDeniedMessageText =
    'The bluetooth scan permission is required to be able to discover and pair nearby Bluetooth devices. Please grant the permission to proceed';
const bluetoothScanPermissionCannotBeRequestedMessageText =
    'Something is preventing us from requesting the bluetooth scan permission. You will have to enable the permission manually in settings';
const bluetoothConnectAndScanPermissionsDeniedMessageText =
    'The bluetooth connect and bluetooth scan permissions are required to be able to discover, connect to and pair nearby Bluetooth devices. Please grant the permission to proceed';
const bluetoothConnectAndScanPermissionsCannotBeRequestedMessageText =
    'Something is preventing us from requesting the bluetooth connect and bluetooth scan permissions. You will have to enable these permissions manually in settings';
const bluetoothNotAvailableMessageText =
    'Bluetooth hardware is not available on this device';
const bluetoothOffMessageText = 'Bluetooth is currently turned off';
