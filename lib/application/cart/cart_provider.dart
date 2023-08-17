// Package imports:
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

// Project imports:
import 'package:riverpod_guide/application/cart/cart_state.dart';
import 'package:riverpod_guide/domain/cart/cart.dart';
import 'package:riverpod_guide/domain/cart/i_cart_repository.dart';
import 'package:riverpod_guide/domain/products/product.dart';
import 'package:riverpod_guide/infrastructure/cart/local_datasource/cart_db.dart';
import '../../infrastructure/cart/in_memory_cart.dart';

final isarProvider = Provider<Isar>((ref) {
  return throw UnimplementedError();
});

final cartDbProvider = Provider<CartDb>((ref) {
  return CartDb(ref.watch(isarProvider));
});

final cartRepositoryProvider = Provider<ICartRepository>((ref) {
  // final database = ref.watch(cartDbProvider);
  return InMemoryCart();
  // return CartRepository(database);
});

final cartStateNotifierProvider =
    StateNotifierProvider<CartStateNotifier, CartState>((ref) {
  final repository = ref.watch(cartRepositoryProvider);
  return CartStateNotifier(repository);
});

class CartStateNotifier extends StateNotifier<CartState> {
  final ICartRepository _repository;

  CartStateNotifier(this._repository, [CartState? state])
      : super(state ?? CartState(cart: Cart.empty(), error: Exception())) {
    getCartItems();
  }

  Future<void> addToCart(Product item) async {
    final duplicatedProduct = state.cart.checkoutItems
        .where((element) => element.product.id == item.id);
    Future<Either<Exception, Cart>> executeFunc;
    if (duplicatedProduct.isNotEmpty) {
      executeFunc = _repository.updateItem(duplicatedProduct.first.id, item);
    } else {
      executeFunc = _repository.addItem(item);
    }
    final result = await executeFunc;
    state = result.fold(
      (l) => state.copyWith(error: l),
      (r) => state.copyWith(cart: r),
    );
  }

  Future<void> updateQuantity({
    required Product item,
    required int quantity,
  }) async {
    state = state.copyWith(
      cart: state.cart.copyWith(
        checkoutItems: state.cart.checkoutItems.map((e) {
          if (e.product.id == item.id) {
            return e.copyWith(
              quantity: quantity,
            );
          }
          return e;
        }).toList(),
      ),
    );
  }

  Future<void> getCartItems() async {
    final result = await _repository.getCartItems();
    state = result.fold(
      (l) => state.copyWith(error: l),
      (r) => state.copyWith(cart: r),
    );
  }
}
