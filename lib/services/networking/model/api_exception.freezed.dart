// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'api_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiException _$ApiExceptionFromJson(Map<String, dynamic> json) {
  return _ApiException.fromJson(json);
}

/// @nodoc
mixin _$ApiException {
  String get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  int? get statusCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiExceptionCopyWith<ApiException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiExceptionCopyWith<$Res> {
  factory $ApiExceptionCopyWith(
          ApiException value, $Res Function(ApiException) then) =
      _$ApiExceptionCopyWithImpl<$Res>;
  $Res call({String message, int? code, int? statusCode});
}

/// @nodoc
class _$ApiExceptionCopyWithImpl<$Res> implements $ApiExceptionCopyWith<$Res> {
  _$ApiExceptionCopyWithImpl(this._value, this._then);

  final ApiException _value;
  // ignore: unused_field
  final $Res Function(ApiException) _then;

  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_ApiExceptionCopyWith<$Res>
    implements $ApiExceptionCopyWith<$Res> {
  factory _$$_ApiExceptionCopyWith(
          _$_ApiException value, $Res Function(_$_ApiException) then) =
      __$$_ApiExceptionCopyWithImpl<$Res>;
  @override
  $Res call({String message, int? code, int? statusCode});
}

/// @nodoc
class __$$_ApiExceptionCopyWithImpl<$Res>
    extends _$ApiExceptionCopyWithImpl<$Res>
    implements _$$_ApiExceptionCopyWith<$Res> {
  __$$_ApiExceptionCopyWithImpl(
      _$_ApiException _value, $Res Function(_$_ApiException) _then)
      : super(_value, (v) => _then(v as _$_ApiException));

  @override
  _$_ApiException get _value => super._value as _$_ApiException;

  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(_$_ApiException(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApiException implements _ApiException {
  const _$_ApiException({required this.message, this.code, this.statusCode});

  factory _$_ApiException.fromJson(Map<String, dynamic> json) =>
      _$$_ApiExceptionFromJson(json);

  @override
  final String message;
  @override
  final int? code;
  @override
  final int? statusCode;

  @override
  String toString() {
    return 'ApiException(message: $message, code: $code, statusCode: $statusCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiException &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality()
                .equals(other.statusCode, statusCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(statusCode));

  @JsonKey(ignore: true)
  @override
  _$$_ApiExceptionCopyWith<_$_ApiException> get copyWith =>
      __$$_ApiExceptionCopyWithImpl<_$_ApiException>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApiExceptionToJson(this);
  }
}

abstract class _ApiException implements ApiException {
  const factory _ApiException(
      {required final String message,
      final int? code,
      final int? statusCode}) = _$_ApiException;

  factory _ApiException.fromJson(Map<String, dynamic> json) =
      _$_ApiException.fromJson;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  int? get code => throw _privateConstructorUsedError;
  @override
  int? get statusCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ApiExceptionCopyWith<_$_ApiException> get copyWith =>
      throw _privateConstructorUsedError;
}
