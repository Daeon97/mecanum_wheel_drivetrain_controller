// ignore_for_file: public_member_api_docs

import 'package:app_settings/app_settings.dart';

class ActionsRepo {
  const ActionsRepo();

  Future<void> openAppSettings() => AppSettings.openAppSettings();
}
