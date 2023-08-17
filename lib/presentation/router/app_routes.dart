// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:riverpod_guide/application/auth/auth_provider.dart';
import 'package:riverpod_guide/infrastructure/auth/enums/auth_status.dart';
import 'package:riverpod_guide/presentation/auth/screens/login_screen.dart';
import 'package:riverpod_guide/presentation/home/screens/home_screen.dart';
import 'package:riverpod_guide/presentation/product/screens/products_screen.dart';
import 'package:riverpod_guide/presentation/unauthorized_screen.dart';
import '../cart/screens/cart_screen.dart';
import '../settings/screens/settings_screen.dart';
import 'error_screen.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

final goRouterProvider = Provider<GoRouter>((ref) {
  final authStatus = ref.watch(
    authStateNotifierProvider.select((value) => value.status),
  );
  return GoRouter(
    navigatorKey: _rootNavigator,
    routes: appRoutes,
    errorBuilder: (context, state) => ErrorScreen(
      errorMessage: state.error?.message ?? '',
    ),
    initialLocation: HomeScreen.path,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      return switch (authStatus) {
        AuthStatus.unauthenticated => LoginScreen.path,
        AuthStatus.unauthorized => UnauthorizedScreen.path,
        AuthStatus.authenticated => state.matchedLocation == "/"
            ? "/${ProductsScreen.path}"
            : state.matchedLocation,
      };
    },
  );
});

final appRoutes = [
  GoRoute(
    name: LoginScreen.named,
    path: LoginScreen.path,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    name: UnauthorizedScreen.named,
    path: UnauthorizedScreen.path,
    builder: (context, state) => const UnauthorizedScreen(),
  ),
  ShellRoute(
    navigatorKey: _shellNavigator,
    builder: (context, state, child) => HomeScreen(
      key: state.pageKey,
      child: child,
    ),
    routes: [
      GoRoute(
        path: "/${ProductsScreen.path}",
        name: ProductsScreen.named,
        pageBuilder: (context, state) => NoTransitionPage(
          child: ProductsScreen(
            key: state.pageKey,
          ),
        ),
      ),
      GoRoute(
        path: "/${CartScreen.path}",
        name: CartScreen.named,
        pageBuilder: (context, state) => NoTransitionPage(
          child: CartScreen(
            key: state.pageKey,
          ),
        ),
      ),
      GoRoute(
        path: "/${SettingScreen.path}",
        name: SettingScreen.named,
        pageBuilder: (context, state) => NoTransitionPage(
          child: SettingScreen(
            key: state.pageKey,
          ),
        ),
      ),
    ],
  ),
];
