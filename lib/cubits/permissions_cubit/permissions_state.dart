// ignore_for_file: public_member_api_docs

part of 'permissions_cubit.dart';

abstract class PermissionsState extends Equatable {
  const PermissionsState();

  @override
  List<Object?> get props => [];
}

class PermissionsInitialState extends PermissionsState {
  const PermissionsInitialState();

  @override
  List<Object?> get props => [];
}

class RequestingPermissionState extends PermissionsState {
  const RequestingPermissionState(
    this.permissionType,
    this.message,
  );

  final PermissionType permissionType;
  final String? message;

  @override
  List<Object?> get props => [
        message,
      ];
}

class PermissionGrantedState extends PermissionsState {
  const PermissionGrantedState(
    this.permissionType,
  );

  final PermissionType permissionType;

  @override
  List<Object?> get props => [
        permissionType,
      ];
}

class PermissionDeniedState extends PermissionsState {
  const PermissionDeniedState(
    this.permissionType,
    this.message,
  );

  final PermissionType permissionType;
  final String message;

  @override
  List<Object?> get props => [
        permissionType,
        message,
      ];
}

class PermissionCannotBeRequestedState extends PermissionsState {
  const PermissionCannotBeRequestedState(
    this.permissionType,
    this.message,
  );

  final PermissionType permissionType;
  final String message;

  @override
  List<Object?> get props => [
        permissionType,
        message,
      ];
}
