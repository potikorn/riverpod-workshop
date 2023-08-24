// Package imports:
import 'package:isar/isar.dart';

part 'cart_entity.g.dart';

@collection
class CheckoutItemEntity {
  Id id = Isar.autoIncrement;
  ProductEntity? product;
}

@embedded
class ProductEntity {
  String? id;
  String? title;
  String? description;
  String? brand;
  String? category;
  double? price;
  double? rating;
  int? stock;
  String? imgUrl;
}
