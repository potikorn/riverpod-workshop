// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:riverpod_guide/application/cart/cart_provider.dart';
import '../../application/product/product_list_provider.dart';

void clearProviders(WidgetRef ref) {
  ref.invalidate(paginationProductListProvider);
  ref.invalidate(cartStateNotifierProvider);
}
