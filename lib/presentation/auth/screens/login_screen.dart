// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:riverpod_guide/application/auth/auth_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  static String named = "login";
  static String path = "/login";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authLoading =
        ref.watch(authStateNotifierProvider.select((value) => value.loading));
    ref.listen<String?>(
      authStateNotifierProvider.select((value) => value.errorMessage),
      (previous, next) {
        if (next != null && (next.isNotEmpty)) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(next)),
          );
        }
      },
    );

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await ref
                .read(authStateNotifierProvider.notifier)
                .login("kminchelle", "0lelplR");
          },
          child: authLoading
              ? const CircularProgressIndicator()
              : const Text("Login"),
        ),
      ),
    );
  }
}
