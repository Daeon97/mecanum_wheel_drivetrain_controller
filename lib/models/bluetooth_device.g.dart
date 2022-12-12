// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bluetooth_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BluetoothDevice _$$_BluetoothDeviceFromJson(Map<String, dynamic> json) =>
    _$_BluetoothDevice(
      address: json['address'] as String,
      name: json['name'] as String?,
      paired: json['paired'] as bool,
      connected: json['connected'] as bool,
    );

Map<String, dynamic> _$$_BluetoothDeviceToJson(_$_BluetoothDevice instance) =>
    <String, dynamic>{
      'address': instance.address,
      'name': instance.name,
      'paired': instance.paired,
      'connected': instance.connected,
    };
