// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'heart_verses_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Verses {
  List<String> get current => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VersesCopyWith<Verses> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VersesCopyWith<$Res> {
  factory $VersesCopyWith(Verses value, $Res Function(Verses) then) =
      _$VersesCopyWithImpl<$Res, Verses>;
  @useResult
  $Res call({List<String> current});
}

/// @nodoc
class _$VersesCopyWithImpl<$Res, $Val extends Verses>
    implements $VersesCopyWith<$Res> {
  _$VersesCopyWithImpl(this._value, this._then);

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
abstract class _$$VersesImplCopyWith<$Res> implements $VersesCopyWith<$Res> {
  factory _$$VersesImplCopyWith(
          _$VersesImpl value, $Res Function(_$VersesImpl) then) =
      __$$VersesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> current});
}

/// @nodoc
class __$$VersesImplCopyWithImpl<$Res>
    extends _$VersesCopyWithImpl<$Res, _$VersesImpl>
    implements _$$VersesImplCopyWith<$Res> {
  __$$VersesImplCopyWithImpl(
      _$VersesImpl _value, $Res Function(_$VersesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
  }) {
    return _then(_$VersesImpl(
      current: null == current
          ? _value._current
          : current // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$VersesImpl with DiagnosticableTreeMixin implements _Verses {
  _$VersesImpl({final List<String> current = const []}) : _current = current;

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
    return 'Verses(current: $current)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Verses'))
      ..add(DiagnosticsProperty('current', current));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VersesImpl &&
            const DeepCollectionEquality().equals(other._current, _current));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_current));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VersesImplCopyWith<_$VersesImpl> get copyWith =>
      __$$VersesImplCopyWithImpl<_$VersesImpl>(this, _$identity);
}

abstract class _Verses implements Verses {
  factory _Verses({final List<String> current}) = _$VersesImpl;

  @override
  List<String> get current;
  @override
  @JsonKey(ignore: true)
  _$$VersesImplCopyWith<_$VersesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
