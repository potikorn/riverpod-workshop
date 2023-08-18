// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:riverpod_guide/application/common/storage_provider.dart';
import 'package:riverpod_guide/locales/custom_asset_loader.dart';
import 'package:riverpod_guide/presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: EasyLocalization(
        path: 'assets/translations',
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('de', 'DE'),
          Locale('ar', "AE"),
        ],
        fallbackLocale: const Locale('en', 'US'),
        assetLoader: const MultipleJsonAssetLoader(),
        child: const App(),
      ),
    ),
  );
}
