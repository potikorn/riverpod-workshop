// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_exception.freezed.dart';

@freezed
abstract class NetworkException with _$NetworkException {
  const factory NetworkException.unauthorized(String message) =
      UnauthorizedException;
  const factory NetworkException.serverError(String message) =
      ServerErrorException;
  const factory NetworkException.notFound(String message) = NotFoundException;
  const factory NetworkException.unknown(String message) =
      UnknownErrorException;
}
