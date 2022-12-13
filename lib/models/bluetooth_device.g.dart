// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bluetooth_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BluetoothDevice _$$_BluetoothDeviceFromJson(Map<String, dynamic> json) =>
    _$_BluetoothDevice(
      name: json['name'] as String?,
      address: json['address'] as String,
      bluetoothDeviceType: $enumDecode(
          _$BluetoothDeviceTypeEnumMap, json['bluetoothDeviceType']),
      paired: json['paired'] as bool,
      connected: json['connected'] as bool,
    );

Map<String, dynamic> _$$_BluetoothDeviceToJson(_$_BluetoothDevice instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'bluetoothDeviceType':
          _$BluetoothDeviceTypeEnumMap[instance.bluetoothDeviceType]!,
      'paired': instance.paired,
      'connected': instance.connected,
    };

const _$BluetoothDeviceTypeEnumMap = {
  BluetoothDeviceType.unknown: 'unknown',
  BluetoothDeviceType.classic: 'classic',
  BluetoothDeviceType.lowEnergy: 'lowEnergy',
  BluetoothDeviceType.dual: 'dual',
};
