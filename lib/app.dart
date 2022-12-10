// ignore_for_file: public_member_api_docs, strict_raw_type

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mecanum_wheel_drivetrain_controller/blocs/blocs.dart';
import 'package:mecanum_wheel_drivetrain_controller/cubits/cubits.dart';
import 'package:mecanum_wheel_drivetrain_controller/repos/repos.dart';
import 'package:mecanum_wheel_drivetrain_controller/screens/screens.dart';
import 'package:mecanum_wheel_drivetrain_controller/utils/utils.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
        providers: _repositoryProviders,
        child: MultiBlocProvider(
          providers: _blocProviders,
          child: MaterialApp(
            theme: ThemeRepo.appTheme,
            onGenerateRoute: _routes,
          ),
        ),
      );

  List<RepositoryProvider> get _repositoryProviders => [
        RepositoryProvider<ActionsRepo>(
          create: (_) => const ActionsRepo(),
        ),
        RepositoryProvider<BluetoothRepo>(
          create: (_) => BluetoothRepo(),
        ),
        RepositoryProvider<PermissionsRepo>(
          create: (_) => const PermissionsRepo(),
        ),
      ];

  List<BlocProvider> get _blocProviders => [
        BlocProvider<BluetoothBloc>(
          create: (ctx) => BluetoothBloc(
            ctx.read<BluetoothRepo>(),
          ),
        ),
        BlocProvider<ActionsCubit>(
          create: (ctx) => ActionsCubit(
            ctx.read<ActionsRepo>(),
          ),
        ),
        BlocProvider<BluetoothAvailabilityCubit>(
          create: (ctx) => BluetoothAvailabilityCubit(
            ctx.read<BluetoothRepo>(),
          ),
        ),
        BlocProvider<BluetoothPermissionCubit>(
          create: (ctx) => BluetoothPermissionCubit(
            ctx.read<PermissionsRepo>(),
          ),
        ),
        BlocProvider<ScreenToShowCubit>(
          create: (ctx) => ScreenToShowCubit(),
        ),
      ];

  Route _routes(RouteSettings routeSettings) => MaterialPageRoute(
        builder: (_) {
          switch (routeSettings.name) {
            case defaultScreenRoute:
              return BlocBuilder<ScreenToShowCubit, ScreenToShowState>(
                builder: (_, screenToShowState) {
                  if (screenToShowState is ShowScreenState) {
                    switch (screenToShowState.screenToShow.screenToShow) {
                      case ScreenToShow.selectConnection:
                        return const SelectConnectionScreen();
                      case ScreenToShow.bluetoothOps:
                        return const BluetoothOpsScreen();
                      case ScreenToShow.wifiOps:
                        return const WifiOpsScreen();
                    }
                  } else {
                    return const SelectConnectionScreen();
                  }
                },
              );
            case bluetoothOpsScreenRoute:
              return const BluetoothOpsScreen();
            case controllerScreenRoute:
              return const ControllerScreen();
            case selectConnectionScreenRoute:
              return const SelectConnectionScreen();
            case wifiOpsScreenRoute:
              return const WifiOpsScreen();
            default:
              return const SizedBox.shrink();
          }
        },
      );
}
