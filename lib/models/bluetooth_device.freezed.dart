// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bluetooth_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BluetoothDevice _$BluetoothDeviceFromJson(Map<String, dynamic> json) {
  return _BluetoothDevice.fromJson(json);
}

/// @nodoc
mixin _$BluetoothDevice {
  String get address => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  bool get paired => throw _privateConstructorUsedError;
  bool get connected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BluetoothDeviceCopyWith<BluetoothDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BluetoothDeviceCopyWith<$Res> {
  factory $BluetoothDeviceCopyWith(
          BluetoothDevice value, $Res Function(BluetoothDevice) then) =
      _$BluetoothDeviceCopyWithImpl<$Res, BluetoothDevice>;
  @useResult
  $Res call({String address, String? name, bool paired, bool connected});
}

/// @nodoc
class _$BluetoothDeviceCopyWithImpl<$Res, $Val extends BluetoothDevice>
    implements $BluetoothDeviceCopyWith<$Res> {
  _$BluetoothDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? name = freezed,
    Object? paired = null,
    Object? connected = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      paired: null == paired
          ? _value.paired
          : paired // ignore: cast_nullable_to_non_nullable
              as bool,
      connected: null == connected
          ? _value.connected
          : connected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BluetoothDeviceCopyWith<$Res>
    implements $BluetoothDeviceCopyWith<$Res> {
  factory _$$_BluetoothDeviceCopyWith(
          _$_BluetoothDevice value, $Res Function(_$_BluetoothDevice) then) =
      __$$_BluetoothDeviceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String address, String? name, bool paired, bool connected});
}

/// @nodoc
class __$$_BluetoothDeviceCopyWithImpl<$Res>
    extends _$BluetoothDeviceCopyWithImpl<$Res, _$_BluetoothDevice>
    implements _$$_BluetoothDeviceCopyWith<$Res> {
  __$$_BluetoothDeviceCopyWithImpl(
      _$_BluetoothDevice _value, $Res Function(_$_BluetoothDevice) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? name = freezed,
    Object? paired = null,
    Object? connected = null,
  }) {
    return _then(_$_BluetoothDevice(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      paired: null == paired
          ? _value.paired
          : paired // ignore: cast_nullable_to_non_nullable
              as bool,
      connected: null == connected
          ? _value.connected
          : connected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BluetoothDevice implements _BluetoothDevice {
  const _$_BluetoothDevice(
      {required this.address,
      required this.name,
      required this.paired,
      required this.connected});

  factory _$_BluetoothDevice.fromJson(Map<String, dynamic> json) =>
      _$$_BluetoothDeviceFromJson(json);

  @override
  final String address;
  @override
  final String? name;
  @override
  final bool paired;
  @override
  final bool connected;

  @override
  String toString() {
    return 'BluetoothDevice(address: $address, name: $name, paired: $paired, connected: $connected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BluetoothDevice &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.paired, paired) || other.paired == paired) &&
            (identical(other.connected, connected) ||
                other.connected == connected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, address, name, paired, connected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BluetoothDeviceCopyWith<_$_BluetoothDevice> get copyWith =>
      __$$_BluetoothDeviceCopyWithImpl<_$_BluetoothDevice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BluetoothDeviceToJson(
      this,
    );
  }
}

abstract class _BluetoothDevice implements BluetoothDevice {
  const factory _BluetoothDevice(
      {required final String address,
      required final String? name,
      required final bool paired,
      required final bool connected}) = _$_BluetoothDevice;

  factory _BluetoothDevice.fromJson(Map<String, dynamic> json) =
      _$_BluetoothDevice.fromJson;

  @override
  String get address;
  @override
  String? get name;
  @override
  bool get paired;
  @override
  bool get connected;
  @override
  @JsonKey(ignore: true)
  _$$_BluetoothDeviceCopyWith<_$_BluetoothDevice> get copyWith =>
      throw _privateConstructorUsedError;
}
