// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../../theme/app_theme.dart';

class ThemeToggle extends ConsumerWidget {
  const ThemeToggle({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppTheme themeProvider = ref.watch(appThemeProvider);
    return ListTile(
      title: Text("dark_mode".tr()),
      trailing: Switch(
        value: themeProvider.isDarkMode ?? false,
        onChanged: (changed) {
          final AppThemeNotifier themeNotifier =
              ref.read(appThemeProvider.notifier);
          if (changed) {
            themeNotifier.setDarkMode(true);
          } else {
            themeNotifier.setDarkMode(false);
          }
        },
      ),
    );
  }
}
