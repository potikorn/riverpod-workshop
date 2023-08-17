// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:riverpod_guide/domain/cart/cart.dart';

part 'cart_state.freezed.dart';

@freezed
abstract class CartState with _$CartState {
  factory CartState({
    required Cart cart,
    required Exception error,
  }) = _CartState;
}
