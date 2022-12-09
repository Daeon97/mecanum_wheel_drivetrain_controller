// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mecanum_wheel_drivetrain_controller/repos/repos.dart';
import 'package:mecanum_wheel_drivetrain_controller/utils/utils.dart';

part 'bluetooth_availability_state.dart';

class BluetoothAvailabilityCubit extends Cubit<BluetoothAvailabilityState> {
  BluetoothAvailabilityCubit(
    this._bluetoothRepo,
  ) : super(
          const BluetoothAvailabilityInitialState(),
        );

  final BluetoothRepo _bluetoothRepo;

  Future<void> checkBluetoothAvailability() async {
    final bluetoothAvailable = await _bluetoothRepo.isBluetoothAvailable;
    if (bluetoothAvailable) {
      emit(
        const BluetoothAvailableState(),
      );
    } else {
      emit(
        const BluetoothNotAvailableState(
          bluetoothNotAvailableMessageText,
        ),
      );
    }
  }
}
