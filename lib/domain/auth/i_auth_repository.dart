// Package imports:
import 'package:fpdart/fpdart.dart';

// Project imports:
import 'package:riverpod_guide/application/config/network/error_exception.dart';

abstract class IAuthRepository {
  Future<Either<NetworkException, String>> authenticate(
    String email,
    String password,
  );
  Future<Either<Exception, bool>> signOut();
  Future<Either<NetworkException, bool>> unauthorized();
}
