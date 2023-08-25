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
  factory CheckoutItem.def({
    required String id,
    required Product product,
    required int quantity,
    required DateTime updatedAt,
    DateTime? createdAt,
  }) = _CheckoutItem;

  factory CheckoutItem({
    required String id,
    required Product product,
    required int quantity,
    required DateTime updatedAt,
  }) {
    return _CheckoutItem(
      id: id,
      product: product,
      quantity: quantity,
      createdAt: DateTime.now(),
      updatedAt: updatedAt,
    );
  }

  const CheckoutItem._();

  factory CheckoutItem.empty() {
    return CheckoutItem(
      id: '',
      product: Product.empty(),
      quantity: 0,
      updatedAt: DateTime.now(),
    );
  }
}
