// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:riverpod_guide/application/cart/cart_provider.dart';
import 'package:riverpod_guide/locales/custom_asset_loader.dart';
import 'package:riverpod_guide/presentation/app.dart';
import 'infrastructure/cart/local_datasource/cart_entity.dart';
import 'shared/providers/storage_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [CheckoutItemEntitySchema],
    directory: dir.path,
  );

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        isarProvider.overrideWithValue(isar),
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
