// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:riverpod_guide/application/auth/auth_provider.dart';
import 'package:riverpod_guide/application/config/network/error_exception.dart';
import 'package:riverpod_guide/domain/auth/i_auth_repository.dart';
import 'package:riverpod_guide/infrastructure/auth/enums/auth_status.dart';
import 'package:riverpod_guide/infrastructure/auth/models/auth_state.dart';
import 'package:riverpod_guide/shared/providers/storage_provider.dart';
import '../../helpers/mock_listener.dart';
import '../../helpers/riverpod_utils.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  group('AuthProvider', () {
    late IAuthRepository mockAuthRepository;
    late SharedPreferences sharedPreferences;

    setUp(() async {
      mockAuthRepository = MockAuthRepository();
      sharedPreferences = MockSharedPreferences();
    });

    group('checkAuthStatus', () {
      test('with null token', () async {
        final container = createContainer(
          overrides: [
            authRepository.overrideWithValue(mockAuthRepository),
            sharedPreferencesProvider.overrideWithValue(sharedPreferences)
          ],
        );
        final listener = MockListener();
        container.listen<AuthState>(
          authStateNotifierProvider,
          listener.call,
          fireImmediately: true,
        );
        verify(
          () => listener(
            null,
            isA<AuthState>()
                .having(
                  (state) => state.accessToken,
                  "access token",
                  equals(isNull),
                )
                .having(
                  (state) => state.status,
                  "status",
                  AuthStatus.unauthenticated,
                ),
          ),
        ).called(1);
      });

      test('with valid token', () async {
        const validToken = "token";
        when(() => sharedPreferences.getString(any())).thenReturn(validToken);
        final container = createContainer(
          overrides: [
            authRepository.overrideWithValue(mockAuthRepository),
            sharedPreferencesProvider.overrideWithValue(sharedPreferences)
          ],
        );
        final listener = MockListener();
        container.listen<AuthState>(
          authStateNotifierProvider,
          listener.call,
          fireImmediately: true,
        );
        verify(
          () => listener(
            null,
            isA<AuthState>()
                .having(
                  (state) => state.accessToken,
                  "access token",
                  equals(validToken),
                )
                .having(
                  (state) => state.status,
                  "status",
                  AuthStatus.authenticated,
                ),
          ),
        ).called(1);
      });
    });

    group('login', () {
      test('with valid credentials', () async {
        const validToken = "token";
        when(() => mockAuthRepository.authenticate(any(), any())).thenAnswer(
          (_) async => right(validToken),
        );
        final container = createContainer(
          overrides: [
            authRepository.overrideWithValue(mockAuthRepository),
            sharedPreferencesProvider.overrideWithValue(sharedPreferences)
          ],
        );
        final listener = MockListener();
        container.listen<AuthState>(
          authStateNotifierProvider,
          listener.call,
          fireImmediately: true,
        );
        await container
            .read(authStateNotifierProvider.notifier)
            .login("a@a.com", "1234");
        verifyInOrder([
          () => listener(
                isA<AuthState>()
                    .having((state) => state.loading, "loading", equals(true))
                    .having(
                      (state) => state.errorMessage,
                      "errorMessage",
                      equals(isEmpty),
                    ),
                isA<AuthState>()
                    .having(
                      (state) => state.accessToken,
                      "access token",
                      equals(validToken),
                    )
                    .having(
                      (state) => state.status,
                      "status",
                      AuthStatus.authenticated,
                    )
                    .having(
                      (state) => state.errorMessage,
                      "errorMessage",
                      equals(isEmpty),
                    ),
              ),
          () => listener(
                isA<AuthState>(),
                isA<AuthState>().having(
                  (state) => state.loading,
                  "loading",
                  equals(false),
                ),
              ),
        ]);
        verify(
          () => mockAuthRepository.authenticate("a@a.com", "1234"),
        ).called(1);
        verifyNoMoreInteractions(mockAuthRepository);
      });

      test('with invalid credentials return server error', () async {
        const exception = NetworkException.serverError(
          "Oops, internal server error",
        );
        when(() => mockAuthRepository.authenticate(any(), any())).thenAnswer(
          (_) async => left(exception),
        );
        final container = createContainer(
          overrides: [
            authRepository.overrideWithValue(mockAuthRepository),
            sharedPreferencesProvider.overrideWithValue(sharedPreferences)
          ],
        );
        final listener = MockListener();
        container.listen<AuthState>(
          authStateNotifierProvider,
          listener.call,
          fireImmediately: true,
        );
        await container
            .read(authStateNotifierProvider.notifier)
            .login("a@a.com", "1234");
        verifyInOrder([
          () => listener(
                isA<AuthState>()
                    .having((state) => state.loading, "loading", equals(true))
                    .having(
                      (state) => state.errorMessage,
                      "errorMessage",
                      equals(isEmpty),
                    ),
                isA<AuthState>()
                    .having(
                      (state) => state.status,
                      "status",
                      AuthStatus.unauthenticated,
                    )
                    .having(
                      (state) => state.errorMessage,
                      "errorMessage",
                      isA<String>(),
                    ),
              ),
          () => listener(
                isA<AuthState>(),
                isA<AuthState>().having(
                  (state) => state.loading,
                  "loading",
                  equals(false),
                ),
              ),
        ]);
        verify(
          () => mockAuthRepository.authenticate("a@a.com", "1234"),
        ).called(1);
        verifyNoMoreInteractions(mockAuthRepository);
      });
    });

    group('logout', () {
      test('with valid api response', () async {
        when(() => mockAuthRepository.signOut())
            .thenAnswer((_) async => right(true));
        final container = createContainer(
          overrides: [
            authRepository.overrideWithValue(mockAuthRepository),
            sharedPreferencesProvider.overrideWithValue(sharedPreferences)
          ],
        );
        final listener = MockListener();
        container.listen<AuthState>(
          authStateNotifierProvider,
          listener.call,
          fireImmediately: true,
        );
        await container.read(authStateNotifierProvider.notifier).logout();
        verifyInOrder([
          () => listener(
              isA<AuthState>()
                  .having((state) => state.loading, "loading", equals(true))
                  .having(
                    (state) => state.errorMessage,
                    "errorMessage",
                    equals(isEmpty),
                  ),
              isA<AuthState>()
                  .having((state) => state.accessToken, 'access token', null)
                  .having((state) => state.loading, 'loading', false)
                  .having(
                    (state) => state.status,
                    'status',
                    AuthStatus.unauthenticated,
                  )),
        ]);
        verify(() => mockAuthRepository.signOut()).called(1);
        verifyNoMoreInteractions(mockAuthRepository);
      });
    });

    test('force set unauthorized', () async {
      const validToken = "token";
      when(() => sharedPreferences.getString(any())).thenReturn(validToken);
      final container = createContainer(
        overrides: [
          authRepository.overrideWithValue(mockAuthRepository),
          sharedPreferencesProvider.overrideWithValue(sharedPreferences)
        ],
      );
      final listener = MockListener();
      container.listen<AuthState>(
        authStateNotifierProvider,
        listener.call,
        fireImmediately: true,
      );
      verify(
        () => listener(
          null,
          isA<AuthState>().having(
              (state) => state.status, "status", AuthStatus.authenticated),
        ),
      );
      await container
          .read(authStateNotifierProvider.notifier)
          .setUnAuthorized();
      verify(
        () => listener(
          isA<AuthState>().having(
              (state) => state.status, "status", AuthStatus.authenticated),
          isA<AuthState>().having(
              (state) => state.status, "status", AuthStatus.unauthorized),
        ),
      );
    });
  });
}
