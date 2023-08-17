// Package imports:
import 'package:isar/isar.dart';

part 'cart_entity.g.dart';

@collection
class CheckoutItemEntity {
  Id id = Isar.autoIncrement;
  ProductEntity? product;
  late int quantity;
}

@embedded
class ProductEntity {
  String? id;
  String? title;
}
