// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mecanum_wheel_drivetrain_controller/utils/utils.dart' as utils;

part 'screen_to_show.freezed.dart';

part 'screen_to_show.g.dart';

@freezed
class ScreenToShow with _$ScreenToShow {
  const factory ScreenToShow({
    required utils.ScreenToShow screenToShow,
  }) = _ScreenToShow;

  factory ScreenToShow.fromJson(
    Map<String, Object?> json,
  ) =>
      _$ScreenToShowFromJson(json);
}
