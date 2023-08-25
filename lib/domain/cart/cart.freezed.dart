// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Cart {
  List<CheckoutItem> get checkoutItems => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartCopyWith<Cart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartCopyWith<$Res> {
  factory $CartCopyWith(Cart value, $Res Function(Cart) then) =
      _$CartCopyWithImpl<$Res, Cart>;
  @useResult
  $Res call({List<CheckoutItem> checkoutItems});
}

/// @nodoc
class _$CartCopyWithImpl<$Res, $Val extends Cart>
    implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkoutItems = null,
  }) {
    return _then(_value.copyWith(
      checkoutItems: null == checkoutItems
          ? _value.checkoutItems
          : checkoutItems // ignore: cast_nullable_to_non_nullable
              as List<CheckoutItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CartCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$$_CartCopyWith(_$_Cart value, $Res Function(_$_Cart) then) =
      __$$_CartCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CheckoutItem> checkoutItems});
}

/// @nodoc
class __$$_CartCopyWithImpl<$Res> extends _$CartCopyWithImpl<$Res, _$_Cart>
    implements _$$_CartCopyWith<$Res> {
  __$$_CartCopyWithImpl(_$_Cart _value, $Res Function(_$_Cart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkoutItems = null,
  }) {
    return _then(_$_Cart(
      checkoutItems: null == checkoutItems
          ? _value._checkoutItems
          : checkoutItems // ignore: cast_nullable_to_non_nullable
              as List<CheckoutItem>,
    ));
  }
}

/// @nodoc

class _$_Cart extends _Cart {
  _$_Cart({required final List<CheckoutItem> checkoutItems})
      : _checkoutItems = checkoutItems,
        super._();

  final List<CheckoutItem> _checkoutItems;
  @override
  List<CheckoutItem> get checkoutItems {
    if (_checkoutItems is EqualUnmodifiableListView) return _checkoutItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_checkoutItems);
  }

  @override
  String toString() {
    return 'Cart(checkoutItems: $checkoutItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Cart &&
            const DeepCollectionEquality()
                .equals(other._checkoutItems, _checkoutItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_checkoutItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartCopyWith<_$_Cart> get copyWith =>
      __$$_CartCopyWithImpl<_$_Cart>(this, _$identity);
}

abstract class _Cart extends Cart {
  factory _Cart({required final List<CheckoutItem> checkoutItems}) = _$_Cart;
  _Cart._() : super._();

  @override
  List<CheckoutItem> get checkoutItems;
  @override
  @JsonKey(ignore: true)
  _$$_CartCopyWith<_$_Cart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CheckoutItem {
  String get id => throw _privateConstructorUsedError;
  Product get product => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, Product product, int quantity,
            DateTime updatedAt, DateTime? createdAt)
        def,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, Product product, int quantity,
            DateTime updatedAt, DateTime? createdAt)?
        def,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, Product product, int quantity,
            DateTime updatedAt, DateTime? createdAt)?
        def,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckoutItem value) def,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckoutItem value)? def,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckoutItem value)? def,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CheckoutItemCopyWith<CheckoutItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutItemCopyWith<$Res> {
  factory $CheckoutItemCopyWith(
          CheckoutItem value, $Res Function(CheckoutItem) then) =
      _$CheckoutItemCopyWithImpl<$Res, CheckoutItem>;
  @useResult
  $Res call(
      {String id,
      Product product,
      int quantity,
      DateTime updatedAt,
      DateTime? createdAt});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class _$CheckoutItemCopyWithImpl<$Res, $Val extends CheckoutItem>
    implements $CheckoutItemCopyWith<$Res> {
  _$CheckoutItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? product = null,
    Object? quantity = null,
    Object? updatedAt = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CheckoutItemCopyWith<$Res>
    implements $CheckoutItemCopyWith<$Res> {
  factory _$$_CheckoutItemCopyWith(
          _$_CheckoutItem value, $Res Function(_$_CheckoutItem) then) =
      __$$_CheckoutItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      Product product,
      int quantity,
      DateTime updatedAt,
      DateTime? createdAt});

  @override
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$_CheckoutItemCopyWithImpl<$Res>
    extends _$CheckoutItemCopyWithImpl<$Res, _$_CheckoutItem>
    implements _$$_CheckoutItemCopyWith<$Res> {
  __$$_CheckoutItemCopyWithImpl(
      _$_CheckoutItem _value, $Res Function(_$_CheckoutItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? product = null,
    Object? quantity = null,
    Object? updatedAt = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$_CheckoutItem(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_CheckoutItem extends _CheckoutItem {
  _$_CheckoutItem(
      {required this.id,
      required this.product,
      required this.quantity,
      required this.updatedAt,
      this.createdAt})
      : super._();

  @override
  final String id;
  @override
  final Product product;
  @override
  final int quantity;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'CheckoutItem.def(id: $id, product: $product, quantity: $quantity, updatedAt: $updatedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckoutItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, product, quantity, updatedAt, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheckoutItemCopyWith<_$_CheckoutItem> get copyWith =>
      __$$_CheckoutItemCopyWithImpl<_$_CheckoutItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, Product product, int quantity,
            DateTime updatedAt, DateTime? createdAt)
        def,
  }) {
    return def(id, product, quantity, updatedAt, createdAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, Product product, int quantity,
            DateTime updatedAt, DateTime? createdAt)?
        def,
  }) {
    return def?.call(id, product, quantity, updatedAt, createdAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, Product product, int quantity,
            DateTime updatedAt, DateTime? createdAt)?
        def,
    required TResult orElse(),
  }) {
    if (def != null) {
      return def(id, product, quantity, updatedAt, createdAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckoutItem value) def,
  }) {
    return def(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckoutItem value)? def,
  }) {
    return def?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckoutItem value)? def,
    required TResult orElse(),
  }) {
    if (def != null) {
      return def(this);
    }
    return orElse();
  }
}

abstract class _CheckoutItem extends CheckoutItem {
  factory _CheckoutItem(
      {required final String id,
      required final Product product,
      required final int quantity,
      required final DateTime updatedAt,
      final DateTime? createdAt}) = _$_CheckoutItem;
  _CheckoutItem._() : super._();

  @override
  String get id;
  @override
  Product get product;
  @override
  int get quantity;
  @override
  DateTime get updatedAt;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_CheckoutItemCopyWith<_$_CheckoutItem> get copyWith =>
      throw _privateConstructorUsedError;
}
