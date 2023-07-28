import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_guide/application/auth/auth_provider.dart';

class UnauthorizedScreen extends ConsumerWidget {
  const UnauthorizedScreen({super.key});

  static const String path = "/unauthorized";
  static const String named = "unauthorized";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authLoading = ref.watch(
      authStateNotifierProvider.select((value) => value.loading),
    );
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await ref.read(authStateNotifierProvider.notifier).logout();
          },
          child: authLoading
              ? const CircularProgressIndicator()
              : const Text("Log out"),
        ),
      ),
    );
  }
}
