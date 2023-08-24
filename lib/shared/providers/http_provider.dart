// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:riverpod_guide/application/config/network/base_http_client.dart';

final httpClient = Provider<BaseHttpClient>((ref) {
  const String baseUrl = "https://dummyjson.com/auth";
  return BaseHttpClient(ref, baseUrl);
});
