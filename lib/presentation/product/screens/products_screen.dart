// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:riverpod_guide/application/config/network/error_exception.dart';
import 'package:riverpod_guide/application/product/product_list_provider.dart';
import 'package:riverpod_guide/domain/products/product.dart';
import 'package:riverpod_guide/presentation/product/widgets/product_item.dart';

class ProductsScreen extends HookConsumerWidget {
  const ProductsScreen({super.key});

  static const String path = "products";
  static const String named = "products";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(paginationProductListProvider);
    final controller = useScrollController();
    ValueNotifier<bool> isLoadMore = useState<bool>(false);

    void listenerCallback() {
      if (controller.position.extentAfter < 300) {
        ref.read(paginationProductListProvider.notifier).fetchNextBatch();
      }
    }

    ref.listen(paginationProductListProvider.select((value) => value),
        (prev, next) {
      if (prev != next) {
        next.mapOrNull(
          data: (value) {
            isLoadMore.value = false;
          },
          onGoingLoading: (value) {
            isLoadMore.value = true;
          },
        );
      }
    });

    useEffect(() {
      controller.addListener(listenerCallback);
      return () => controller.removeListener(listenerCallback);
    }, [controller]);

    return Stack(
      children: [
        data.when(
          data: (products) {
            return _GridProductsBuilder(
              products: products,
              controller: controller,
            );
          },
          error: (error, stackTrace) {
            log(stackTrace.toString());
            final message = error.mapOrNull(
              serverError: (exception) => exception.message,
              notFound: (exception) => exception.message,
            );
            return Center(child: Text("Error: ${message.toString()}"));
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          onGoingError: (
            List<Product> items,
            NetworkException exception,
            StackTrace? stacktrace,
          ) {
            return _GridProductsBuilder(
              products: items,
              controller: controller,
            );
          },
          onGoingLoading: (List<Product> items) {
            return _GridProductsBuilder(
              products: items,
              controller: controller,
            );
          },
        ),
        Visibility(
          visible: isLoadMore.value,
          child: const Align(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CupertinoActivityIndicator(),
                Text("Loading..."),
                SizedBox(height: 16.0)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _GridProductsBuilder extends ConsumerWidget {
  const _GridProductsBuilder({
    Key? key,
    required this.controller,
    required this.products,
  }) : super(key: key);

  final ScrollController controller;
  final List<Product> products;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(() {
        return ref.refresh(paginationProductListProvider);
      }),
      child: GridView.builder(
        key: const PageStorageKey<String>('products_list'),
        controller: controller,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final item = products[index];
          return ProductItem(item: item);
        },
      ),
    );
  }
}
