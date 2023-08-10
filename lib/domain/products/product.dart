// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:riverpod_guide/shared/utils/formatter/currency_formatter.dart';

part 'product.freezed.dart';

@freezed
abstract class Product with _$Product {
  factory Product({
    int? id,
    required String title,
    required String description,
    double? price,
    double? discount,
    double? rating,
    int? stock,
    required String brand,
    required String category,
    required String thumbnail,
    required List<String> images,
  }) = _Product;

  const Product._();

  factory Product.empty() => Product(
        title: '',
        description: '',
        brand: '',
        category: '',
        thumbnail: '',
        images: [],
      );

  String getPriceFormatted() => CurrencyFormatUtils.formatInUSD(price);
}
