import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_guide/application/auth/auth_provider.dart';
import 'package:riverpod_guide/application/product/product_list_provider.dart';

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
                ref.invalidate(paginationProductListProvider);
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
