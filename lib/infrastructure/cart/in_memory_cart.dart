// Package imports:
import 'package:fpdart/fpdart.dart';
import 'package:uuid/uuid.dart';

// Project imports:
import 'package:riverpod_guide/domain/cart/cart.dart';
import 'package:riverpod_guide/domain/cart/i_cart_repository.dart';
import 'package:riverpod_guide/domain/products/product.dart';

class InMemoryCart implements ICartRepository {
  Cart cart = Cart.empty();

  @override
  Future<Either<Exception, Cart>> addItem(Product item) async {
    final List<CheckoutItem> originItems = [...cart.checkoutItems];
    cart = cart.copyWith(
      checkoutItems: originItems
        ..add(
          CheckoutItem(
            id: const Uuid().v4(),
            product: item,
            quantity: 1,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        ),
    );
    return right(cart);
  }

  @override
  Future<Either<Exception, bool>> clearItems() {
    // TODO: implement clearItems
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, Cart>> getCartItems() async {
    return right(cart);
  }

  @override
  Future<Either<Exception, bool>> removeItem(String removeId) async {
    cart = cart.copyWith(
      checkoutItems: cart.checkoutItems
        ..removeWhere((element) => element.id == removeId),
    );
    return right(true);
  }

  @override
  Future<Either<Exception, Cart>> updateItem(
      String id, Product updatedProduct) async {
    final List<CheckoutItem> originItems = List.from(cart.checkoutItems);
    cart = cart.copyWith(
      checkoutItems: originItems.map(
        (e) {
          if (e.product.id == updatedProduct.id) {
            return e.copyWith(
              quantity: e.quantity + 1,
              updatedAt: DateTime.now(),
            );
          }
          return e;
        },
      ).toList(),
    );
    return right(cart);
  }
}
