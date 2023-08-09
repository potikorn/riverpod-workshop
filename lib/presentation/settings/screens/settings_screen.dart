// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:riverpod_guide/application/auth/auth_provider.dart';
import 'package:riverpod_guide/application/utils/riverpod_utils.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  static String named = "settings";
  static String path = "settings";

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final authLoading = ref
            .watch(authStateNotifierProvider.select((value) => value.loading));
        return Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                clearProviders(ref);
                await ref.read(authStateNotifierProvider.notifier).logout();
              },
              child: authLoading
                  ? const CircularProgressIndicator()
                  : const Text("Log out"),
            ),
          ],
        );
      },
    );
  }
}
