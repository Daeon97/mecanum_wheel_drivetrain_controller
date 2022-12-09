// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mecanum_wheel_drivetrain_controller/repos/repos.dart';

part 'actions_state.dart';

class ActionsCubit extends Cubit<ActionsState> {
  ActionsCubit(
    this._actionsRepo,
  ) : super(
          const ActionsInitialState(),
        );

  final ActionsRepo _actionsRepo;

  Future<void> openAppSettings() => _actionsRepo.openAppSettings();
}
