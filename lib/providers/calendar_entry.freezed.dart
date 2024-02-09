// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CalendarEntry _$CalendarEntryFromJson(Map<String, dynamic> json) {
  return _CalendarEntry.fromJson(json);
}

/// @nodoc
mixin _$CalendarEntry {
  String get imagePath => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalendarEntryCopyWith<CalendarEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarEntryCopyWith<$Res> {
  factory $CalendarEntryCopyWith(
          CalendarEntry value, $Res Function(CalendarEntry) then) =
      _$CalendarEntryCopyWithImpl<$Res, CalendarEntry>;
  @useResult
  $Res call({String imagePath, String name, int index});
}

/// @nodoc
class _$CalendarEntryCopyWithImpl<$Res, $Val extends CalendarEntry>
    implements $CalendarEntryCopyWith<$Res> {
  _$CalendarEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePath = null,
    Object? name = null,
    Object? index = null,
  }) {
    return _then(_value.copyWith(
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalendarEntryImplCopyWith<$Res>
    implements $CalendarEntryCopyWith<$Res> {
  factory _$$CalendarEntryImplCopyWith(
          _$CalendarEntryImpl value, $Res Function(_$CalendarEntryImpl) then) =
      __$$CalendarEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String imagePath, String name, int index});
}

/// @nodoc
class __$$CalendarEntryImplCopyWithImpl<$Res>
    extends _$CalendarEntryCopyWithImpl<$Res, _$CalendarEntryImpl>
    implements _$$CalendarEntryImplCopyWith<$Res> {
  __$$CalendarEntryImplCopyWithImpl(
      _$CalendarEntryImpl _value, $Res Function(_$CalendarEntryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePath = null,
    Object? name = null,
    Object? index = null,
  }) {
    return _then(_$CalendarEntryImpl(
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CalendarEntryImpl implements _CalendarEntry {
  _$CalendarEntryImpl(
      {required this.imagePath, required this.name, required this.index});

  factory _$CalendarEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalendarEntryImplFromJson(json);

  @override
  final String imagePath;
  @override
  final String name;
  @override
  final int index;

  @override
  String toString() {
    return 'CalendarEntry(imagePath: $imagePath, name: $name, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarEntryImpl &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.index, index) || other.index == index));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, imagePath, name, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarEntryImplCopyWith<_$CalendarEntryImpl> get copyWith =>
      __$$CalendarEntryImplCopyWithImpl<_$CalendarEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalendarEntryImplToJson(
      this,
    );
  }
}

abstract class _CalendarEntry implements CalendarEntry {
  factory _CalendarEntry(
      {required final String imagePath,
      required final String name,
      required final int index}) = _$CalendarEntryImpl;

  factory _CalendarEntry.fromJson(Map<String, dynamic> json) =
      _$CalendarEntryImpl.fromJson;

  @override
  String get imagePath;
  @override
  String get name;
  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$CalendarEntryImplCopyWith<_$CalendarEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
