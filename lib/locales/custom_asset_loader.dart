// Dart imports:
import 'dart:convert';
import 'dart:ui';

// Flutter imports:
import 'package:flutter/services.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'file_names.dart';

class MultipleJsonAssetLoader extends AssetLoader {
  const MultipleJsonAssetLoader();

  String getLocalePath(
    String basePath,
    Locale locale,
    String fileNamePath,
  ) {
    return '$basePath/${locale.toLanguageTag()}/$fileNamePath.json';
  }

  (bool, String?) _findDuplicateKey(
    Map<dynamic, dynamic> originMap,
    Map<dynamic, dynamic> targetMap,
  ) {
    Set<dynamic> keysSet = {};
    keysSet.addAll(originMap.keys);
    for (var key in targetMap.keys) {
      if (keysSet.contains(key)) {
        return (true, key);
      }
    }
    return (false, null);
  }

  @override
  Future<Map<String, dynamic>> load(
    String path,
    Locale locale,
  ) async {
    Map<String, dynamic> langs = {};
    try {
      for (final fileName in localeFilesName) {
        var localePath = getLocalePath(path, locale, fileName);
        EasyLocalization.logger.debug('Load asset from $localePath');
        final jsonMap = json.decode(await rootBundle.loadString(localePath));
        final (isDuplicated, duplicatedKey) = _findDuplicateKey(langs, jsonMap);
        if (isDuplicated) {
          throw Exception(
              "Duplicate key name in $localePath with this key `$duplicatedKey`");
        }
        langs = {...langs, ...jsonMap};
      }
    } catch (e) {
      EasyLocalization.logger.error(e.toString());
      EasyLocalization.logger.debug(langs.toString());
      return langs;
    }
    return langs;
  }
}
