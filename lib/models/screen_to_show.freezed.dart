// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'screen_to_show.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScreenToShow _$ScreenToShowFromJson(Map<String, dynamic> json) {
  return _ScreenToShow.fromJson(json);
}

/// @nodoc
mixin _$ScreenToShow {
  utils.ScreenToShow get screenToShow => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScreenToShowCopyWith<ScreenToShow> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreenToShowCopyWith<$Res> {
  factory $ScreenToShowCopyWith(
          ScreenToShow value, $Res Function(ScreenToShow) then) =
      _$ScreenToShowCopyWithImpl<$Res, ScreenToShow>;
  @useResult
  $Res call({utils.ScreenToShow screenToShow});
}

/// @nodoc
class _$ScreenToShowCopyWithImpl<$Res, $Val extends ScreenToShow>
    implements $ScreenToShowCopyWith<$Res> {
  _$ScreenToShowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screenToShow = null,
  }) {
    return _then(_value.copyWith(
      screenToShow: null == screenToShow
          ? _value.screenToShow
          : screenToShow // ignore: cast_nullable_to_non_nullable
              as utils.ScreenToShow,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScreenToShowCopyWith<$Res>
    implements $ScreenToShowCopyWith<$Res> {
  factory _$$_ScreenToShowCopyWith(
          _$_ScreenToShow value, $Res Function(_$_ScreenToShow) then) =
      __$$_ScreenToShowCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({utils.ScreenToShow screenToShow});
}

/// @nodoc
class __$$_ScreenToShowCopyWithImpl<$Res>
    extends _$ScreenToShowCopyWithImpl<$Res, _$_ScreenToShow>
    implements _$$_ScreenToShowCopyWith<$Res> {
  __$$_ScreenToShowCopyWithImpl(
      _$_ScreenToShow _value, $Res Function(_$_ScreenToShow) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screenToShow = null,
  }) {
    return _then(_$_ScreenToShow(
      screenToShow: null == screenToShow
          ? _value.screenToShow
          : screenToShow // ignore: cast_nullable_to_non_nullable
              as utils.ScreenToShow,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScreenToShow implements _ScreenToShow {
  const _$_ScreenToShow({required this.screenToShow});

  factory _$_ScreenToShow.fromJson(Map<String, dynamic> json) =>
      _$$_ScreenToShowFromJson(json);

  @override
  final utils.ScreenToShow screenToShow;

  @override
  String toString() {
    return 'ScreenToShow(screenToShow: $screenToShow)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScreenToShow &&
            (identical(other.screenToShow, screenToShow) ||
                other.screenToShow == screenToShow));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, screenToShow);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScreenToShowCopyWith<_$_ScreenToShow> get copyWith =>
      __$$_ScreenToShowCopyWithImpl<_$_ScreenToShow>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScreenToShowToJson(
      this,
    );
  }
}

abstract class _ScreenToShow implements ScreenToShow {
  const factory _ScreenToShow(
      {required final utils.ScreenToShow screenToShow}) = _$_ScreenToShow;

  factory _ScreenToShow.fromJson(Map<String, dynamic> json) =
      _$_ScreenToShow.fromJson;

  @override
  utils.ScreenToShow get screenToShow;
  @override
  @JsonKey(ignore: true)
  _$$_ScreenToShowCopyWith<_$_ScreenToShow> get copyWith =>
      throw _privateConstructorUsedError;
}
