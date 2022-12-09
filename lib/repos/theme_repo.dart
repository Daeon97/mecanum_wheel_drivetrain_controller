// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:mecanum_wheel_drivetrain_controller/utils/utils.dart';

class ThemeRepo {
  const ThemeRepo();

  static ThemeData get appTheme => ThemeData(
        primaryColor: baseColor,
        primaryColorLight: baseColor.withOpacity(
          nilDotThree,
        ),
        primaryColorDark: baseColor.withOpacity(
          nilDotSeven,
        ),
        errorColor: Colors.red,
        colorScheme: ThemeData().colorScheme.copyWith(
              brightness: Brightness.light,
              primary: baseColor,
            ),
        // textTheme: const TextTheme(
        //   bodyLarge: TextStyle(
        //     color: baseColor,
        //   ),
        //   bodyMedium: TextStyle(
        //     color: baseColor,
        //   ),
        //   bodySmall: TextStyle(
        //     color: baseColor,
        //   ),
        // ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStatePropertyAll<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  smallPadding,
                ),
              ),
            ),
            backgroundColor: const MaterialStatePropertyAll<Color>(
              baseColor,
            ),
            padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(
                vertical: smallPadding,
                horizontal: padding,
              ),
            ),
          ),
        ),
      );
}
