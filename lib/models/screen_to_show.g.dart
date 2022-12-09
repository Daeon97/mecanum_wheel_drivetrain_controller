// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_to_show.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScreenToShow _$$_ScreenToShowFromJson(Map<String, dynamic> json) =>
    _$_ScreenToShow(
      screenToShow: $enumDecode(_$ScreenToShowEnumMap, json['screenToShow']),
    );

Map<String, dynamic> _$$_ScreenToShowToJson(_$_ScreenToShow instance) =>
    <String, dynamic>{
      'screenToShow': _$ScreenToShowEnumMap[instance.screenToShow]!,
    };

const _$ScreenToShowEnumMap = {
  utils.ScreenToShow.selectConnection: 'selectConnection',
  utils.ScreenToShow.bluetoothOps: 'bluetoothOps',
  utils.ScreenToShow.wifiOps: 'wifiOps',
};
