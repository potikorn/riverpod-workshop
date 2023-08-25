// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:riverpod_guide/application/cart/cart_provider.dart';
import '../../../domain/cart/cart.dart';

class CheckoutItemView extends StatelessWidget {
  const CheckoutItemView({
    super.key,
    required this.item,
  });

  final CheckoutItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  item.product.thumbnail,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.product.title),
                    Text(
                      item.product.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    _QuantityControl(item: item),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuantityControl extends ConsumerWidget {
  const _QuantityControl({
    required this.item,
  });

  final CheckoutItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.read(cartStateNotifierProvider.notifier);
    return Row(
      children: [
        FilledButton(
          onPressed: () {
            if (item.quantity <= 1) {
              return;
            }
            cart.removeFromCart(
              item: item.product,
              quantity: item.quantity - 1,
            );
          },
          child: const Icon(Icons.remove),
        ),
        Expanded(
          child: Center(
            child: Text(item.quantity.toRadixString(10)),
          ),
        ),
        FilledButton(
          onPressed: () => cart.addToCart(item.product),
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
