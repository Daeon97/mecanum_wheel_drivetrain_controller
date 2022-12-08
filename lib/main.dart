import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mecanum_wheel_drivetrain_controller/app.dart';

void main() async {
  await dotenv.load();
  runApp(
    const App(),
  );
}
