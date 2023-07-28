import 'package:riverpod_guide/infrastructure/auth/enums/auth_status.dart';

class AuthState {
  final String? accessToken;
  final AuthStatus status;
  final String? errorMessage;
  final bool loading;

  bool get hasError =>
      errorMessage != null && (errorMessage?.isNotEmpty ?? false);

  AuthState({
    this.accessToken,
    this.status = AuthStatus.unauthenticated,
    this.errorMessage,
    this.loading = false,
  });

  AuthState copyWith({
    String? accessToken,
    AuthStatus? status,
    String? errorMessage,
    bool? loading,
  }) {
    return AuthState(
      accessToken: accessToken ?? this.accessToken,
      status: status ?? this.status,
      loading: loading ?? this.loading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory AuthState.initial() {
    return AuthState(
      status: AuthStatus.unauthenticated,
      accessToken: null,
      errorMessage: null,
      loading: false,
    );
  }
}
