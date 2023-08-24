// Package imports:
import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

// Project imports:
import '../../../domain/products/product.dart';
import 'cart_entity.dart';

abstract class ICartDb {
  Future<Either<Exception, List<CheckoutItemEntity>>> addItem(Product item);
  Future<Either<Exception, List<CheckoutItemEntity>>> updateItem(
      CheckoutItemEntity entity);
  Future<Either<Exception, List<CheckoutItemEntity>>> getAllItems();
}

class CartDb implements ICartDb {
  late final Isar _db;

  CartDb(this._db);

  @override
  Future<Either<Exception, List<CheckoutItemEntity>>> addItem(
    Product item,
  ) async {
    final productItem = ProductEntity()
      ..title = item.title
      ..description = item.description
      ..brand = item.brand
      ..price = item.price
      ..category = item.category
      ..rating = item.rating
      ..stock = item.stock
      ..imgUrl = item.thumbnail
      ..id = item.id.toString();
    final checkoutItem = CheckoutItemEntity()..product = productItem;
    final entity = await _db.writeTxn(
      () => _db.checkoutItemEntitys.put(checkoutItem),
    );
    if (entity != -1) {
      final entities = await _db.checkoutItemEntitys.where().findAll();
      return right(entities);
    }
    return left(Exception());
  }

  @override
  Future<Either<Exception, List<CheckoutItemEntity>>> updateItem(
    CheckoutItemEntity entity,
  ) async {
    throw UnimplementedError("no implementation found");
    // await _db.writeTxn(() async {
    //   final oldItem = await _db.checkoutItemEntitys.get(entity.id);
    //   oldItem?.quantity = oldItem.quantity + 1;
    //   await _db.checkoutItemEntitys.put(oldItem!);
    // });
    // return getAllItems();
  }

  @override
  Future<Either<Exception, List<CheckoutItemEntity>>> getAllItems() async {
    // await _db.writeTxn(_db.checkoutItemEntitys.clear);
    final entities = await _db.checkoutItemEntitys.where().findAll();
    return right(entities);
  }
}
