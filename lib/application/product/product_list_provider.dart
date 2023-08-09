// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:riverpod_guide/application/common/http_provider.dart';
import 'package:riverpod_guide/application/common/pagination/pagination_provider.dart';
import 'package:riverpod_guide/application/common/pagination/pagination_state.dart';
import 'package:riverpod_guide/domain/products/product.dart';
import 'package:riverpod_guide/infrastructure/products/product_repository.dart';

final productRepository = Provider<ProductRepository>((ref) {
  final client = ref.watch(httpClient);
  return ProductRepository(client);
});

final paginationProductListProvider = StateNotifierProvider<
    PaginationNotifier<Product>, PaginationState<Product>>((ref) {
  return PaginationNotifier(
    itemsPerBatch: 20,
    fetchNextItems: (nextPage) {
      return ref.read(productRepository).getAllProducts(
            PaginationParams(
              limit: 20,
              page: (nextPage - 1) * 20,
            ),
          );
    },
  )..init();
});

class PaginationParams {
  final int limit;
  final int page;

  const PaginationParams({
    this.limit = 30,
    this.page = 1,
  });

  factory PaginationParams.empty() => const PaginationParams();
}
