// Package imports:
import 'package:collection/collection.dart';
import 'package:fpdart/fpdart.dart';

// Project imports:
import 'package:riverpod_guide/domain/cart/cart.dart';
import 'package:riverpod_guide/domain/cart/i_cart_repository.dart';
import 'package:riverpod_guide/domain/products/product.dart';
import 'package:riverpod_guide/infrastructure/cart/source/local/cart_db.dart';
import 'package:riverpod_guide/infrastructure/cart/source/local/cart_entity.dart';

class CartRepository implements ICartRepository {
  final ICartDb _localDb;

  CartRepository(this._localDb);

  @override
  Future<Either<Exception, Cart>> addToCart(Product item) async {
    final result = await _localDb.addItem(item);
    final foldResult = result.fold(
      (l) => l,
      (r) => Cart(checkoutItems: transformToCheckoutItems(r)),
    );
    if (result.isLeft()) {
      return left(foldResult as Exception);
    }
    return right(foldResult as Cart);
  }

  @override
  Future<Either<Exception, bool>> clearItems() {
    // TODO: implement clearItems
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, Cart>> getCartItems() async {
    final results = await _localDb.getAllItems();
    final foldResult = results.fold(
      (l) => l,
      (r) => Cart(checkoutItems: transformToCheckoutItems(r)),
    );
    if (results.isLeft()) {
      return left(foldResult as Exception);
    }
    return right(foldResult as Cart);
  }

  @override
  Future<Either<Exception, bool>> removeFromCart(String removeId) async {
    final results = await _localDb.removeItem(removeId);
    final foldResult = results.fold(
      (l) => l,
      (r) => r,
    );
    if (results.isLeft()) {
      return left(foldResult as Exception);
    }
    return right(foldResult as bool);
  }
}

List<CheckoutItem> transformToCheckoutItems(
  List<CheckoutItemEntity> cartItems,
) {
  final groupedItems = groupBy(
    cartItems,
    (CheckoutItemEntity cartItem) => cartItem.product!.productId,
  );

  final checkoutItems = groupedItems.entries
      .map((entry) {
        final cartItemsWithSameProduct = entry.value;
        final totalQuantity = cartItemsWithSameProduct.length;
        final product = cartItemsWithSameProduct.first.product;
        return CheckoutItem(
          id: 'checkout-p-${product?.productId}',
          product: Product(
            id: int.tryParse(product?.productId.toString() ?? ""),
            title: product?.title ?? "",
            description: product?.description ?? "",
            brand: product?.brand ?? "",
            category: product?.category ?? "",
            thumbnail: product?.imgUrl ?? "",
            images: [],
          ),
          quantity: totalQuantity,
          updatedAt: DateTime.now(),
        );
      })
      .sortedBy(
        (element) => element.createdAt!,
      )
      .toList();
  return checkoutItems;
}
