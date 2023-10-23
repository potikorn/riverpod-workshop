// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:riverpod_guide/application/cart/cart_provider.dart';
import 'package:riverpod_guide/application/cart/cart_state.dart';
import 'package:riverpod_guide/domain/cart/cart.dart';
import 'package:riverpod_guide/domain/cart/i_cart_repository.dart';
import '../../helpers/mock_listener.dart';
import '../../helpers/riverpod_utils.dart';

class MockCartRepository extends Mock implements ICartRepository {}

void main() {
  group('CartProvider', () {
    group('CartStateNotifier', () {
      late ICartRepository mockCartRepository;

      setUp(() {
        mockCartRepository = MockCartRepository();
      });

      group('getItems', () {
        test('init state with carts item empty', () {
          final expectedValue = Cart(checkoutItems: []);
          when(() => mockCartRepository.getCartItems()).thenAnswer(
            (_) async => right(expectedValue),
          );
          final container = createContainer(overrides: [
            cartRepositoryProvider.overrideWithValue(mockCartRepository),
          ]);
          final listener = MockListener<CartState>();
          addTearDown(container.dispose);
          container.listen(
            cartStateNotifierProvider,
            listener,
            fireImmediately: true,
          );
          verify(() => mockCartRepository.getCartItems()).called(1);
          expect(
            container.read(cartStateNotifierProvider).cart,
            equals(expectedValue),
          );
        });
      });
    });
  });
}
