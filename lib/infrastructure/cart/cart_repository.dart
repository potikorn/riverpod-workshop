// Package imports:
import 'package:collection/collection.dart';
import 'package:fpdart/fpdart.dart';

// Project imports:
import 'package:riverpod_guide/domain/cart/cart.dart';
import 'package:riverpod_guide/domain/cart/i_cart_repository.dart';
import 'package:riverpod_guide/domain/products/product.dart';
import 'package:riverpod_guide/infrastructure/cart/local_datasource/cart_db.dart';
import 'package:riverpod_guide/infrastructure/cart/local_datasource/cart_entity.dart';

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
  Future<Either<Exception, bool>> removeFromCart(String removeId) {
    // TODO: implement removeItem
    throw UnimplementedError();
  }
}

List<CheckoutItem> transformToCheckoutItems(
  List<CheckoutItemEntity> cartItems,
) {
  final groupedItems = groupBy(
    cartItems,
    (CheckoutItemEntity cartItem) => cartItem.product!.id,
  );

  final checkoutItems = groupedItems.entries.map((entry) {
    final productId = entry.key;
    final cartItemsWithSameProduct = entry.value;
    final totalQuantity = cartItemsWithSameProduct.length;
    final product = cartItemsWithSameProduct.first.product;

    return CheckoutItem(
      id: 'checkout-p-$productId',
      product: Product(
        id: int.parse(product?.id.toString() ?? ""),
        title: product?.title ?? "",
        description: "",
        brand: "",
        category: "",
        thumbnail: product?.imgUrl ?? "",
        images: [],
      ),
      quantity: totalQuantity,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }).toList();
  return checkoutItems;
}
