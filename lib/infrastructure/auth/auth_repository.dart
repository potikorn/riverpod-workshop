import 'package:fpdart/fpdart.dart';
import 'package:riverpod_guide/application/config/network/base_http_client.dart';
import 'package:riverpod_guide/application/config/network/error_exception.dart';
import 'package:riverpod_guide/domain/auth/i_auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository implements IAuthRepository {
  final BaseHttpClient _client;
  final SharedPreferences _pref;

  const AuthRepository(this._client, this._pref);

  @override
  Future<Either<NetworkException, String>> authenticate(
    String email,
    String password,
  ) async {
    final response = await _client.post(
      '/login',
      body: {
        "username": email,
        "password": password,
        // "expiresInMins": 1,
      },
    );
    return response.fold(
      (error) => left(error),
      (response) async {
        await _pref.setString('token', response["token"]);
        return right(response["token"]);
      },
    );
  }

  @override
  Future<Either<Exception, bool>> signOut() async {
    await Future.delayed(const Duration(milliseconds: 300));
    await _pref.remove('token');
    return right(true);
  }

  @override
  Future<Either<NetworkException, bool>> unauthorized() async {
    final response = await _client.get('/http/401');
    return response.fold(
      (error) => left(error),
      (response) => right(true),
    );
  }
}
