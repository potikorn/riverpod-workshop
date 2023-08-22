// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:riverpod_guide/application/common/storage_provider.dart';

part 'color_schemes.g.dart';

ThemeData buildLightTheme() {
  var baseTheme = ThemeData.light(useMaterial3: true);
  return baseTheme.copyWith(
    colorScheme: lightColorScheme,
    textTheme: GoogleFonts.kanitTextTheme(baseTheme.textTheme),
  );
}

ThemeData buildDarkTheme() {
  var baseTheme = ThemeData.dark(useMaterial3: true);
  return baseTheme.copyWith(
    colorScheme: darkColorScheme,
    textTheme: GoogleFonts.kanitTextTheme(baseTheme.textTheme),
  );
}

class AppTheme {
  final bool? isDarkMode;
  final ThemeData? data;

  AppTheme({
    this.isDarkMode = false,
    this.data,
  });

  factory AppTheme.empty() => AppTheme();

  AppTheme copyWith({
    bool? isDarkMode,
    ThemeData? data,
  }) {
    return AppTheme(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      data: data ?? this.data,
    );
  }
}

final appThemeProvider =
    StateNotifierProvider<AppThemeNotifier, AppTheme>((ref) {
  final SharedPreferences pref = ref.watch(sharedPreferencesProvider);
  return AppThemeNotifier(pref);
});

class AppThemeNotifier extends StateNotifier<AppTheme> {
  final SharedPreferences pref;

  AppThemeNotifier(this.pref, [AppTheme? state])
      : super(state ?? AppTheme.empty()) {
    initialize();
  }

  initialize() {
    final bool? isDarkMode = pref.getBool("isDarkMode");
    state = state.copyWith(
      data: (isDarkMode ?? false) ? buildDarkTheme() : buildLightTheme(),
      isDarkMode: isDarkMode,
    );
  }

  void setDarkMode(bool isDarkMode) {
    pref.setBool("isDarkMode", isDarkMode);
    state = state.copyWith(
      data: isDarkMode ? buildDarkTheme() : buildLightTheme(),
      isDarkMode: isDarkMode,
    );
  }
}
