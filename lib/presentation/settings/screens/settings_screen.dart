// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:riverpod_guide/application/auth/auth_provider.dart';
import 'package:riverpod_guide/shared/utils/riverpod_utils.dart';

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
            ListTile(
              title: Text("language".tr()),
              trailing: Text(context.locale.languageCode.toUpperCase()),
              onTap: () {
                Navigator.of(context).restorablePush(dialogBuilder);
              },
            ),
            ElevatedButton(
              onPressed: () async {
                clearProviders(ref);
                await ref.read(authStateNotifierProvider.notifier).logout();
              },
              child: authLoading
                  ? const CircularProgressIndicator()
                  : Text("logout_button".tr()),
            ),
          ],
        );
      },
    );
  }
}

Route<Object?> dialogBuilder(BuildContext context, Object? arguments) {
  return DialogRoute<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        icon: const Icon(Icons.language),
        title: const Text('Basic dialog title'),
        content: Column(
          children: context.supportedLocales
              .map(
                (e) => ListTile(
                  title: Text(e.languageCode.toUpperCase()),
                  onTap: () {
                    context.setLocale(e);
                    context.pop();
                  },
                ),
              )
              .toList(),
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
