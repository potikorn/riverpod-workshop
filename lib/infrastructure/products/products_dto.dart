import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_guide/domain/products/product.dart';

part 'products_dto.freezed.dart';
part 'products_dto.g.dart';

@freezed
abstract class ProductsDto with _$ProductsDto {
  factory ProductsDto({
    List<ProductDto>? products,
    int? total,
    int? skip,
    int? limit,
  }) = _ProductsDto;

  const ProductsDto._();

  factory ProductsDto.fromJson(Map<String, dynamic> json) =>
      _$ProductsDtoFromJson(json);
}

@freezed
abstract class ProductDto with _$ProductDto {
  factory ProductDto({
    int? id,
    String? title,
    String? description,
    double? price,
    double? discount,
    double? rating,
    int? stock,
    String? brand,
    String? category,
    String? thumbnail,
    List<String>? images,
  }) = _ProductDto;

  const ProductDto._();

  Product toDomain() {
    return Product(
      id: id,
      title: title ?? '',
      description: description ?? '',
      price: price,
      discount: discount,
      rating: rating,
      stock: stock,
      brand: brand ?? '',
      category: category ?? '',
      thumbnail: thumbnail ?? '',
      images: images ?? [],
    );
  }

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);
}
