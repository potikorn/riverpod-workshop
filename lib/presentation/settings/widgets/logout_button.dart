// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../../../application/auth/auth_provider.dart';
import '../../../shared/utils/riverpod_utils.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final authLoading = ref
            .watch(authStateNotifierProvider.select((value) => value.loading));
        return ElevatedButton(
          onPressed: () async {
            clearProviders(ref);
            await ref.read(authStateNotifierProvider.notifier).logout();
          },
          child: authLoading
              ? const CircularProgressIndicator()
              : Text("logout_button".tr()),
        );
      },
    );
  }
}
