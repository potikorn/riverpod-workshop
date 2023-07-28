import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_guide/application/auth/auth_provider.dart';
import 'package:riverpod_guide/infrastructure/auth/enums/auth_status.dart';
import 'package:riverpod_guide/presentation/auth/screens/login_screen.dart';
import 'package:riverpod_guide/presentation/home/screens/home_screen.dart';
import 'package:riverpod_guide/presentation/product/screens/products_screen.dart';
import 'package:riverpod_guide/presentation/settings/screens/settings_screen.dart';
import 'package:riverpod_guide/presentation/unauthorized_screen.dart';

import 'error_screen.dart';

final appRoutes = [
  GoRoute(
    name: HomeScreen.named,
    path: HomeScreen.path,
    builder: (context, state) => HomeScreen(),
    routes: [
      GoRoute(
        path: ProductsScreen.path,
        name: ProductsScreen.named,
        builder: (context, state) => const ProductsScreen(),
      ),
      GoRoute(
        path: SettingScreen.path,
        name: SettingScreen.named,
        builder: (context, state) => const SettingScreen(),
      )
    ],
  ),
  GoRoute(
    name: LoginScreen.named,
    path: LoginScreen.path,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    name: UnauthorizedScreen.named,
    path: UnauthorizedScreen.path,
    builder: (context, state) => const UnauthorizedScreen(),
  )
];

GoRouter getRoutes(WidgetRef ref) {
  final router = GoRouter(
    routes: appRoutes,
    errorBuilder: (context, state) => ErrorScreen(
      errorMessage: state.error?.message ?? '',
    ),
    initialLocation: HomeScreen.path,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final authStatus = ref.watch(
        authStateNotifierProvider.select((value) => value.status),
      );
      return switch (authStatus) {
        AuthStatus.unauthenticated => LoginScreen.path,
        AuthStatus.unauthorized => UnauthorizedScreen.path,
        AuthStatus.authenticated => HomeScreen.path
      };
    },
  );
  return router;
}
