// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:riverpod_guide/application/cart/cart_provider.dart';
import 'package:riverpod_guide/domain/cart/cart.dart';
import 'package:riverpod_guide/presentation/cart/widgets/checkout_item.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  static const String path = "cart";
  static const String named = "cart";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartStateNotifierProvider);
    return ListView.separated(
      itemCount: cart.cart.checkoutItems.length,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 8.0);
      },
      itemBuilder: (context, index) {
        final CheckoutItem checkoutItem = cart.cart.checkoutItems[index];
        return CheckoutItemView(item: checkoutItem);
      },
    );
  }
}
