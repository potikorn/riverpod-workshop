// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:riverpod_guide/application/cart/cart_provider.dart';
import 'package:riverpod_guide/application/common/storage_provider.dart';
import 'package:riverpod_guide/presentation/app.dart';
import 'infrastructure/cart/local_datasource/cart_entity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      child: const App(),
    ),
  );
}
