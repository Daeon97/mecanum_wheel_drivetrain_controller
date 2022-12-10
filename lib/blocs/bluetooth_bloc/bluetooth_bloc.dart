// ignore_for_file: public_member_api_docs, cancel_subscriptions

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_blue/flutter_blue.dart' as f_b;
import 'package:hydrated_bloc/hydrated_bloc.dart';
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
          (bluetoothState) {
            if (bluetoothState == f_b.BluetoothState.on) {
              // add(
              // ,
              // );
            } else if (bluetoothState == f_b.BluetoothState.off) {
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
    on<StopListeningBluetoothStateEvent>(
      (event, emit) async {
        if (_bluetoothStateStreamSubscription != null) {
          await _bluetoothStateStreamSubscription!.cancel();
          _bluetoothStateStreamSubscription = null;
        }
      },
    );
  }

  StreamSubscription<f_b.BluetoothState>? _bluetoothStateStreamSubscription;
}
