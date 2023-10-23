// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:riverpod_guide/application/config/network/base_http_client.dart';
import 'package:riverpod_guide/application/config/network/error_exception.dart';
import 'package:riverpod_guide/infrastructure/auth/auth_repository.dart';

class MockHttpClient extends Mock implements BaseHttpClient {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late BaseHttpClient client;
  late SharedPreferences pref;
  late AuthRepository authRepository;

  setUp(() {
    client = MockHttpClient();
    pref = MockSharedPreferences();
    authRepository = AuthRepository(
      client,
      pref,
    );
  });

  group('AuthRepository', () {
    group('fetch login', () {
      test('successful', () async {
        // arrange
        when(() => client.post(any(), body: any(named: 'body'))).thenAnswer(
          (_) async => right({"token": "token_string"}),
        );
        when(() => pref.setString(any(), any())).thenAnswer((_) async => true);

        // act
        final actual = await authRepository.authenticate(
          'a@a.com',
          '1234',
        );
        // assert
        expect(
          actual,
          isA<Right<NetworkException, String>>().having(
            (result) => result,
            "success value token",
            right("token_string"),
          ),
        );
        verify(
          () => pref.setString(
            AuthRepository.tokenKeyPref,
            "token_string",
          ),
        );
      });

      test(
        'unsuccessful with status code 404',
        () async {
          // arrange
          when(() => client.post(any(), body: any(named: 'body'))).thenAnswer(
            (_) async => left(const NetworkException.notFound("url not found")),
          );

          // act
          final actual = await authRepository.authenticate(
            'a@a.com',
            '1234',
          );

          // assert
          expect(
            actual,
            isA<Left<NetworkException, String>>().having(
              (result) => result,
              "left value",
              left(const NetworkException.notFound("url not found")),
            ),
          );
          verifyZeroInteractions(pref);
        },
      );
    });
  });
}
