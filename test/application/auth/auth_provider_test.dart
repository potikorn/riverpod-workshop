// import 'package:flutter_test/flutter_test.dart';
// import 'package:fpdart/fpdart.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:riverpod_guide/application/auth/auth_provider.dart';
// import 'package:riverpod_guide/application/config/network/error_exception.dart';
// import 'package:riverpod_guide/domain/auth/i_auth_repository.dart';
// import 'package:riverpod_guide/infrastructure/auth/enums/auth_status.dart';

// class MockAuthRepository extends Mock implements IAuthRepository {}

// void main() {
//   late AuthStateNotifier authStateNotifier;
//   late MockAuthRepository mockAuthRepository;

//   setUp(() {
//     mockAuthRepository = MockAuthRepository();
//     authStateNotifier = AuthStateNotifier(mockAuthRepository, null);
//   });

//   test('checkAuthStatus with null token', () async {
//     await authStateNotifier.checkAuthStatus();
//     expect(authStateNotifier.state.status, AuthStatus.unauthenticated);
//   });

//   test('checkAuthStatus with non-null token', () async {
//     authStateNotifier = AuthStateNotifier(mockAuthRepository, 'token');
//     await authStateNotifier.checkAuthStatus();
//     expect(authStateNotifier.state.status, AuthStatus.authenticated);
//   });

//   test('login with valid credentials', () async {
//     when(() => mockAuthRepository.authenticate('email', 'password'))
//         .thenAnswer((_) async => right('token'));
//     await authStateNotifier.login('email', 'password');
//     expect(authStateNotifier.state.status, AuthStatus.authenticated);
//     expect(authStateNotifier.state.accessToken, 'token');
//   });

//   test('login with invalid credentials', () async {
//     when(() => mockAuthRepository.authenticate('email', 'password'))
//         .thenAnswer((_) async => left(const NetworkException.unauthorized('')));
//     await authStateNotifier.login('email', 'password');
//     expect(authStateNotifier.state.status, AuthStatus.unauthenticated);
//     expect(authStateNotifier.state.errorMessage, 'unauthorized');
//   });

//   test('logout', () async {
//     when(() => mockAuthRepository.signOut())
//         .thenAnswer((_) async => right(true));
//     await authStateNotifier.logout();
//     verify(() => mockAuthRepository.signOut()).called(1);
//     expect(authStateNotifier.state.status, AuthStatus.unauthenticated);
//     expect(authStateNotifier.state.accessToken, null);
//   });

//   test('setUnAuthorized', () {
//     authStateNotifier.setUnAuthorized();
//     expect(authStateNotifier.state.status, AuthStatus.unauthorized);
//     expect(authStateNotifier.state.accessToken, null);
//   });
// }
