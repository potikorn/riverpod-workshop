// Package imports:
import 'package:fpdart/fpdart.dart';

// Project imports:
import 'package:riverpod_guide/domain/products/product.dart';
import 'cart.dart';

abstract class ICartRepository {
  Future<Either<Exception, Cart>> getCartItems();
  Future<Either<Exception, Cart>> addToCart(Product item);
  Future<Either<Exception, bool>> removeFromCart(String removeId);
  Future<Either<Exception, bool>> clearItems();
}
