// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NetworkException {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) serverError,
    required TResult Function(String message) notFound,
    required TResult Function(String message) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? serverError,
    TResult Function(String message)? notFound,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(ServerErrorException value) serverError,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(UnknownErrorException value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(ServerErrorException value)? serverError,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(UnknownErrorException value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(ServerErrorException value)? serverError,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(UnknownErrorException value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NetworkExceptionCopyWith<NetworkException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkExceptionCopyWith<$Res> {
  factory $NetworkExceptionCopyWith(
          NetworkException value, $Res Function(NetworkException) then) =
      _$NetworkExceptionCopyWithImpl<$Res, NetworkException>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$NetworkExceptionCopyWithImpl<$Res, $Val extends NetworkException>
    implements $NetworkExceptionCopyWith<$Res> {
  _$NetworkExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnauthorizedExceptionCopyWith<$Res>
    implements $NetworkExceptionCopyWith<$Res> {
  factory _$$UnauthorizedExceptionCopyWith(_$UnauthorizedException value,
          $Res Function(_$UnauthorizedException) then) =
      __$$UnauthorizedExceptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnauthorizedExceptionCopyWithImpl<$Res>
    extends _$NetworkExceptionCopyWithImpl<$Res, _$UnauthorizedException>
    implements _$$UnauthorizedExceptionCopyWith<$Res> {
  __$$UnauthorizedExceptionCopyWithImpl(_$UnauthorizedException _value,
      $Res Function(_$UnauthorizedException) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UnauthorizedException(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnauthorizedException implements UnauthorizedException {
  const _$UnauthorizedException(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NetworkException.unauthorized(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthorizedException &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnauthorizedExceptionCopyWith<_$UnauthorizedException> get copyWith =>
      __$$UnauthorizedExceptionCopyWithImpl<_$UnauthorizedException>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) serverError,
    required TResult Function(String message) notFound,
    required TResult Function(String message) unknown,
  }) {
    return unauthorized(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? unknown,
  }) {
    return unauthorized?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? serverError,
    TResult Function(String message)? notFound,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(ServerErrorException value) serverError,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(UnknownErrorException value) unknown,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(ServerErrorException value)? serverError,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(UnknownErrorException value)? unknown,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(ServerErrorException value)? serverError,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(UnknownErrorException value)? unknown,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class UnauthorizedException implements NetworkException {
  const factory UnauthorizedException(final String message) =
      _$UnauthorizedException;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$UnauthorizedExceptionCopyWith<_$UnauthorizedException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServerErrorExceptionCopyWith<$Res>
    implements $NetworkExceptionCopyWith<$Res> {
  factory _$$ServerErrorExceptionCopyWith(_$ServerErrorException value,
          $Res Function(_$ServerErrorException) then) =
      __$$ServerErrorExceptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ServerErrorExceptionCopyWithImpl<$Res>
    extends _$NetworkExceptionCopyWithImpl<$Res, _$ServerErrorException>
    implements _$$ServerErrorExceptionCopyWith<$Res> {
  __$$ServerErrorExceptionCopyWithImpl(_$ServerErrorException _value,
      $Res Function(_$ServerErrorException) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ServerErrorException(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ServerErrorException implements ServerErrorException {
  const _$ServerErrorException(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NetworkException.serverError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerErrorException &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerErrorExceptionCopyWith<_$ServerErrorException> get copyWith =>
      __$$ServerErrorExceptionCopyWithImpl<_$ServerErrorException>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) serverError,
    required TResult Function(String message) notFound,
    required TResult Function(String message) unknown,
  }) {
    return serverError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? unknown,
  }) {
    return serverError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? serverError,
    TResult Function(String message)? notFound,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(ServerErrorException value) serverError,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(UnknownErrorException value) unknown,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(ServerErrorException value)? serverError,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(UnknownErrorException value)? unknown,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(ServerErrorException value)? serverError,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(UnknownErrorException value)? unknown,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerErrorException implements NetworkException {
  const factory ServerErrorException(final String message) =
      _$ServerErrorException;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ServerErrorExceptionCopyWith<_$ServerErrorException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundExceptionCopyWith<$Res>
    implements $NetworkExceptionCopyWith<$Res> {
  factory _$$NotFoundExceptionCopyWith(
          _$NotFoundException value, $Res Function(_$NotFoundException) then) =
      __$$NotFoundExceptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NotFoundExceptionCopyWithImpl<$Res>
    extends _$NetworkExceptionCopyWithImpl<$Res, _$NotFoundException>
    implements _$$NotFoundExceptionCopyWith<$Res> {
  __$$NotFoundExceptionCopyWithImpl(
      _$NotFoundException _value, $Res Function(_$NotFoundException) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NotFoundException(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NotFoundException implements NotFoundException {
  const _$NotFoundException(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NetworkException.notFound(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFoundException &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotFoundExceptionCopyWith<_$NotFoundException> get copyWith =>
      __$$NotFoundExceptionCopyWithImpl<_$NotFoundException>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) serverError,
    required TResult Function(String message) notFound,
    required TResult Function(String message) unknown,
  }) {
    return notFound(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? unknown,
  }) {
    return notFound?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? serverError,
    TResult Function(String message)? notFound,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(ServerErrorException value) serverError,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(UnknownErrorException value) unknown,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(ServerErrorException value)? serverError,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(UnknownErrorException value)? unknown,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(ServerErrorException value)? serverError,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(UnknownErrorException value)? unknown,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFoundException implements NetworkException {
  const factory NotFoundException(final String message) = _$NotFoundException;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$NotFoundExceptionCopyWith<_$NotFoundException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownErrorExceptionCopyWith<$Res>
    implements $NetworkExceptionCopyWith<$Res> {
  factory _$$UnknownErrorExceptionCopyWith(_$UnknownErrorException value,
          $Res Function(_$UnknownErrorException) then) =
      __$$UnknownErrorExceptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnknownErrorExceptionCopyWithImpl<$Res>
    extends _$NetworkExceptionCopyWithImpl<$Res, _$UnknownErrorException>
    implements _$$UnknownErrorExceptionCopyWith<$Res> {
  __$$UnknownErrorExceptionCopyWithImpl(_$UnknownErrorException _value,
      $Res Function(_$UnknownErrorException) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UnknownErrorException(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnknownErrorException implements UnknownErrorException {
  const _$UnknownErrorException(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NetworkException.unknown(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownErrorException &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownErrorExceptionCopyWith<_$UnknownErrorException> get copyWith =>
      __$$UnknownErrorExceptionCopyWithImpl<_$UnknownErrorException>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) serverError,
    required TResult Function(String message) notFound,
    required TResult Function(String message) unknown,
  }) {
    return unknown(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? unknown,
  }) {
    return unknown?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? serverError,
    TResult Function(String message)? notFound,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(ServerErrorException value) serverError,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(UnknownErrorException value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(ServerErrorException value)? serverError,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(UnknownErrorException value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(ServerErrorException value)? serverError,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(UnknownErrorException value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class UnknownErrorException implements NetworkException {
  const factory UnknownErrorException(final String message) =
      _$UnknownErrorException;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$UnknownErrorExceptionCopyWith<_$UnknownErrorException> get copyWith =>
      throw _privateConstructorUsedError;
}
