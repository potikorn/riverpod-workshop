// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../product/product_list_provider.dart';

void clearProviders(WidgetRef ref) {
  ref.invalidate(paginationProductListProvider);
}
