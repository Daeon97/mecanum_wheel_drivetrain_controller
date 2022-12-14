// ignore_for_file: public_member_api_docs, cancel_subscriptions

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_blue/flutter_blue.dart' as f_b;
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart'
    as f_b_s;
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mecanum_wheel_drivetrain_controller/models/models.dart'
    as models;
import 'package:mecanum_wheel_drivetrain_controller/repos/repos.dart';
import 'package:mecanum_wheel_drivetrain_controller/utils/utils.dart';

part 'bluetooth_event.dart';

part 'bluetooth_state.dart';

class BluetoothBloc extends Bloc<BluetoothEvent, BluetoothState> {
  BluetoothBloc(
    BluetoothRepo bluetoothRepo,
  ) : super(
          const BluetoothInitialState(),
        ) {
    on<TurnBluetoothOnEvent>(
      (event, emit) async {
        final turnBluetoothOn = await bluetoothRepo.turnBluetoothOn();
        if (turnBluetoothOn == null || !turnBluetoothOn) {
          await bluetoothRepo.openBluetoothSettings();
        }
      },
    );
    on<ListenBluetoothStateEvent>(
      (event, emit) async {
        if (_bluetoothStateStreamSubscription != null) {
          await _bluetoothStateStreamSubscription!.cancel();
          _bluetoothStateStreamSubscription = null;
        }
        _bluetoothStateStreamSubscription = bluetoothRepo.bluetoothState.listen(
          (bluetoothState) async {
            if (bluetoothState == f_b.BluetoothState.on) {
              add(
                const ListenBluetoothDevicesEvent(),
              );
            } else if (bluetoothState == f_b.BluetoothState.off) {
              if (_bluetoothDevicesStreamSubscription != null) {
                await _bluetoothDevicesStreamSubscription!.cancel();
                _bluetoothDevicesStreamSubscription = null;
              }
              add(
                const BluetoothOffEvent(
                  bluetoothOffMessageText,
                ),
              );
            }
          },
        );
      },
    );
    on<BluetoothOffEvent>(
      (event, emit) {
        emit(
          BluetoothOffState(
            event.message,
          ),
        );
      },
    );
    on<ListenBluetoothDevicesEvent>(
      (event, emit) async {
        if (_bluetoothDevicesStreamSubscription != null) {
          await _bluetoothDevicesStreamSubscription!.cancel();
          _bluetoothDevicesStreamSubscription = null;
        }
        final bluetoothDevicesEntry = <String, f_b_s.BluetoothDevice>{};
        _bluetoothDevicesStreamSubscription =
            bluetoothRepo.bluetoothDevices.listen(
          (bluetoothDiscoveryResult) {
            bluetoothDevicesEntry.putIfAbsent(
              bluetoothDiscoveryResult.device.address,
              () => bluetoothDiscoveryResult.device,
            );
            final bluetoothDevices = <models.BluetoothDevice>[];
            for (final bluetoothDevice in bluetoothDevicesEntry.values) {
              bluetoothDevices.add(
                models.BluetoothDevice(
                  name: bluetoothDevice.name,
                  address: bluetoothDevice.address,
                  bluetoothDeviceType: bluetoothRepo.computeBluetoothDeviceType(
                    bluetoothDiscoveryResult.device,
                  ),
                  paired: bluetoothDevice.isBonded,
                  connected: bluetoothDevice.isConnected,
                ),
              );
            }
            add(
              FoundBluetoothDevicesEvent(
                bluetoothDevices,
              ),
            );
          },
          onDone: () async {
            await _bluetoothDevicesStreamSubscription!.cancel();
            _bluetoothDevicesStreamSubscription = null;
          },
        );
      },
    );
    on<FoundBluetoothDevicesEvent>(
      (event, emit) async {
        emit(
          FoundBluetoothDevicesState(
            event.bluetoothDevices,
          ),
        );
      },
    );
    on<InitiateBluetoothPairingRequestEvent>(
      (event, emit) async {
        final pairingRequestResult = await bluetoothRepo.pairBluetoothDevice(
          event.bluetoothDevice.address,
        );
        if (pairingRequestResult == null || !pairingRequestResult) {
          emit(
            const PairingFailedState(
              failedToPairBluetoothDeviceText,
            ),
          );
        } else {
          emit(
            const PairedSuccessfullyState(),
          );
        }
      },
    );
    on<InitiateBluetoothConnectionRequestEvent>(
      (event, emit) async {
        final bluetoothConnectionRequestResult =
            await bluetoothRepo.connectToBluetoothDevice(
          event.address,
        );
        if (bluetoothConnectionRequestResult.isConnected) {
          emit(
            const ConnectedSuccessfullyState(),
          );
        } else {
          emit(
            const ConnectionFailedState(
              failedToConnectToBluetoothDeviceText,
            ),
          );
        }
      },
    );
    on<GetPairedBluetoothDevicesEvent>(
      (event, emit) async {
        final pairedBluetoothDevices =
            await bluetoothRepo.pairedBluetoothDevices;
        final bluetoothDevices = <models.BluetoothDevice>[];
        for (final pairedBluetoothDevice in pairedBluetoothDevices) {
          bluetoothDevices.add(
            models.BluetoothDevice(
              name: pairedBluetoothDevice.name,
              address: pairedBluetoothDevice.address,
              bluetoothDeviceType: bluetoothRepo.computeBluetoothDeviceType(
                pairedBluetoothDevice,
              ),
              paired: pairedBluetoothDevice.isBonded,
              connected: pairedBluetoothDevice.isConnected,
            ),
          );
        }
        emit(
          GotPairedBluetoothDevicesState(
            bluetoothDevices,
          ),
        );
      },
    );
    on<StopListeningBluetoothDevicesAndStateEvent>(
      (event, emit) async {
        if (_bluetoothDevicesStreamSubscription != null) {
          await _bluetoothDevicesStreamSubscription!.cancel();
          _bluetoothDevicesStreamSubscription = null;
        }
        if (_bluetoothStateStreamSubscription != null) {
          await _bluetoothStateStreamSubscription!.cancel();
          _bluetoothStateStreamSubscription = null;
        }
      },
    );
  }

  StreamSubscription<f_b.BluetoothState>? _bluetoothStateStreamSubscription;
  StreamSubscription<f_b_s.BluetoothDiscoveryResult>?
      _bluetoothDevicesStreamSubscription;
}
