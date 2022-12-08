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
            theme: ThemeData(
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
            ),
            onGenerateRoute: _routes,
          ),
        ),
      );

  List<RepositoryProvider> get _repositoryProviders => [
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
        BlocProvider<PermissionsCubit>(
          create: (ctx) => PermissionsCubit(
            ctx.read<PermissionsRepo>(),
          ),
        ),
      ];

  Route _routes(RouteSettings routeSettings) => MaterialPageRoute(
        builder: (_) {
          switch (routeSettings.name) {
            case defaultScreenRoute:
              return BlocBuilder<PermissionsCubit, PermissionsState>(
                builder: (_, permissionsState) => permissionsState
                            is PermissionsInitialState ||
                        (permissionsState is PermissionDeniedState &&
                            (permissionsState.permissionType ==
                                    PermissionType.bluetoothConnect ||
                                permissionsState.permissionType ==
                                    PermissionType.bluetoothScan)) ||
                        (permissionsState is PermissionCannotBeRequestedState &&
                            (permissionsState.permissionType ==
                                    PermissionType.bluetoothConnect ||
                                permissionsState.permissionType ==
                                    PermissionType.bluetoothScan))
                    ? const BluetoothPermissionStateScreen()
                    : const HomeScreen(),
              );
            case bluetoothPermissionStateScreenRoute:
              return const BluetoothPermissionStateScreen();
            case homeScreenRoute:
              return const HomeScreen();
            default:
              return const SizedBox.shrink();
          }
        },
      );
}
