// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../widgets/language_switcher.dart';
import '../widgets/logout_button.dart';
import '../widgets/theme_toggle.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  static String named = "settings";
  static String path = "settings";

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        LanguageSwitcher(),
        ThemeToggle(),
        LogoutButton(),
      ],
    );
  }
}
