import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_guide/application/common/http_provider.dart';
import 'package:riverpod_guide/application/common/storage_provider.dart';
import 'package:riverpod_guide/domain/auth/i_auth_repository.dart';
import 'package:riverpod_guide/infrastructure/auth/auth_repository.dart';
import 'package:riverpod_guide/infrastructure/auth/enums/auth_status.dart';
import 'package:riverpod_guide/infrastructure/auth/models/auth_state.dart';

final authRepository = Provider<AuthRepository>((ref) {
  final client = ref.watch(httpClient);
  final pref = ref.watch(sharedPreferencesProvider);
  return AuthRepository(client, pref);
});

final authStateNotifierProvider =
    StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  final repository = ref.watch(authRepository);
  final String? token = ref.watch(sharedPreferencesProvider).getString('token');
  return AuthStateNotifier(repository, token);
});

class AuthStateNotifier extends StateNotifier<AuthState> {
  final IAuthRepository _repository;
  final String? _token;

  AuthStateNotifier(this._repository, this._token, [AuthState? state])
      : super(state ?? AuthState.initial()) {
    checkAuthStatus();
  }

  Future<void> checkAuthStatus() async {
    // TODO check token to get refresh token or set token expired
    if (_token != null && (_token?.isNotEmpty ?? false)) {
      state = state.copyWith(
        status: AuthStatus.authenticated,
        accessToken: _token,
      );
      return;
    }
    state = state.copyWith(
      status: AuthStatus.unauthenticated,
    );
  }

  Future<void> login(String email, String password) async {
    state = state.copyWith(
      loading: true,
      errorMessage: "",
    );
    final results = await _repository.authenticate(email, password);
    results.fold(
      (e) {
        state = state.copyWith(
          errorMessage: e.mapOrNull(
            unauthorized: (_) => "unauthorized",
            serverError: (_) => "serverError",
            unknown: (_) => "unknown",
          ),
        );
      },
      (token) {
        state = state.copyWith(
          accessToken: token,
          status: AuthStatus.authenticated,
          errorMessage: '',
        );
      },
    );
    state = state.copyWith(
      loading: false,
    );
  }

  Future<void> logout() async {
    state = state.copyWith(
      loading: true,
      errorMessage: '',
    );
    await _repository.signOut();
    state = state.copyWith(
      accessToken: null,
      status: AuthStatus.unauthenticated,
      loading: false,
    );
  }

  void setUnAuthorized() {
    state = state.copyWith(
      errorMessage: null,
      accessToken: null,
      status: AuthStatus.unauthorized,
      loading: false,
    );
  }
}
