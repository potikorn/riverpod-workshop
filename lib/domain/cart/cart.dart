// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:riverpod_guide/domain/products/product.dart';

part 'cart.freezed.dart';

@freezed
abstract class Cart with _$Cart {
  factory Cart({
    required List<CheckoutItem> checkoutItems,
  }) = _Cart;

  const Cart._();

  factory Cart.empty() {
    return Cart(
      checkoutItems: [],
    );
  }

  int get count {
    if (checkoutItems.isEmpty) {
      return 0;
    }
    return checkoutItems
        .map((t) => t.quantity)
        .reduce((value, element) => value + element);
  }
}

@freezed
abstract class CheckoutItem with _$CheckoutItem {
  factory CheckoutItem({
    required String id,
    required Product product,
    required int quantity,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _CheckoutItem;

  const CheckoutItem._();

  factory CheckoutItem.empty() {
    return CheckoutItem(
      id: '',
      product: Product.empty(),
      quantity: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
}
