// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mecanum_wheel_drivetrain_controller/models/models.dart';

part 'screen_to_show_state.dart';

class ScreenToShowCubit extends HydratedCubit<ScreenToShowState> {
  ScreenToShowCubit()
      : super(
          const ScreenToShowInitialState(),
        );

  @override
  ScreenToShowState? fromJson(Map<String, dynamic> json) {
    try {
      final screenToShow = ScreenToShow.fromJson(json);
      return ShowScreenState(
        screenToShow,
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(ScreenToShowState state) =>
      state is ShowScreenState ? state.screenToShow.toJson() : null;
}
