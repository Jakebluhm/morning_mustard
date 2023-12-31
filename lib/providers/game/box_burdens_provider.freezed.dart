// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'box_burdens_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Burdens {
  List<String> get current => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BurdensCopyWith<Burdens> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BurdensCopyWith<$Res> {
  factory $BurdensCopyWith(Burdens value, $Res Function(Burdens) then) =
      _$BurdensCopyWithImpl<$Res, Burdens>;
  @useResult
  $Res call({List<String> current});
}

/// @nodoc
class _$BurdensCopyWithImpl<$Res, $Val extends Burdens>
    implements $BurdensCopyWith<$Res> {
  _$BurdensCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
  }) {
    return _then(_value.copyWith(
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BurdensImplCopyWith<$Res> implements $BurdensCopyWith<$Res> {
  factory _$$BurdensImplCopyWith(
          _$BurdensImpl value, $Res Function(_$BurdensImpl) then) =
      __$$BurdensImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> current});
}

/// @nodoc
class __$$BurdensImplCopyWithImpl<$Res>
    extends _$BurdensCopyWithImpl<$Res, _$BurdensImpl>
    implements _$$BurdensImplCopyWith<$Res> {
  __$$BurdensImplCopyWithImpl(
      _$BurdensImpl _value, $Res Function(_$BurdensImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
  }) {
    return _then(_$BurdensImpl(
      current: null == current
          ? _value._current
          : current // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$BurdensImpl with DiagnosticableTreeMixin implements _Burdens {
  _$BurdensImpl({final List<String> current = const []}) : _current = current;

  final List<String> _current;
  @override
  @JsonKey()
  List<String> get current {
    if (_current is EqualUnmodifiableListView) return _current;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_current);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Burdens(current: $current)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Burdens'))
      ..add(DiagnosticsProperty('current', current));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BurdensImpl &&
            const DeepCollectionEquality().equals(other._current, _current));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_current));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BurdensImplCopyWith<_$BurdensImpl> get copyWith =>
      __$$BurdensImplCopyWithImpl<_$BurdensImpl>(this, _$identity);
}

abstract class _Burdens implements Burdens {
  factory _Burdens({final List<String> current}) = _$BurdensImpl;

  @override
  List<String> get current;
  @override
  @JsonKey(ignore: true)
  _$$BurdensImplCopyWith<_$BurdensImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
