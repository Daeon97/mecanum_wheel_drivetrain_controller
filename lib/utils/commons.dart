// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:mecanum_wheel_drivetrain_controller/utils/constants.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart'
    as top_snackbar_flutter;

void showTopSnackbar(
  BuildContext context,
  String message,
) {
  top_snackbar_flutter.showTopSnackBar(
    Overlay.of(context)!,
    displayDuration: Duration(
      seconds: veryTinyPadding.toInt(),
    ),
    CustomSnackBar.info(
      message: message,
      backgroundColor: Theme.of(context).primaryColor,
    ),
  );
}
