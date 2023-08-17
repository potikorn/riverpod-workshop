// Package imports:
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
  Future<Either<Exception, Cart>> addItem(Product item) async {
    final result = await _localDb.addItem(item);
    final foldResult = result.fold(
      (l) => l,
      (r) => Cart(
        checkoutItems: r
            .map(
              (e) => CheckoutItem(
                id: e.id.toString(),
                product: Product(
                  id: e.id,
                  title: e.product?.title ?? '',
                  description: '',
                  brand: '',
                  category: '',
                  thumbnail: '',
                  images: [],
                ),
                quantity: e.quantity,
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
              ),
            )
            .toList(),
      ),
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
      (r) => Cart(
        checkoutItems: r
            .map(
              (e) => CheckoutItem(
                id: e.id.toString(),
                product: Product(
                  id: e.id,
                  title: e.product?.title ?? '',
                  description: '',
                  brand: '',
                  category: '',
                  thumbnail: '',
                  images: [],
                ),
                quantity: e.quantity,
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
              ),
            )
            .toList(),
      ),
    );
    if (results.isLeft()) {
      return left(foldResult as Exception);
    }
    return right(foldResult as Cart);
  }

  @override
  Future<Either<Exception, bool>> removeItem(String removeId) {
    // TODO: implement removeItem
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, Cart>> updateItem(
      String id, Product updatedItem) async {
    final results = await _localDb.updateItem(
      CheckoutItemEntity()..id = updatedItem.id!.toInt(),
    );
    final foldResult = results.fold(
      (l) => l,
      (r) => Cart(
        checkoutItems: r
            .map(
              (e) => CheckoutItem(
                id: e.id.toString(),
                product: Product(
                  id: e.id,
                  title: e.product?.title ?? '',
                  description: '',
                  brand: '',
                  category: '',
                  thumbnail: '',
                  images: [],
                ),
                quantity: e.quantity,
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
              ),
            )
            .toList(),
      ),
    );
    if (results.isLeft()) {
      return left(foldResult as Exception);
    }
    return right(foldResult as Cart);
  }
}
