// Package imports:
import 'package:fpdart/fpdart.dart';

// Project imports:
import 'package:riverpod_guide/application/config/network/base_http_client.dart';
import 'package:riverpod_guide/application/config/network/error_exception.dart';
import 'package:riverpod_guide/application/product/product_list_provider.dart';
import 'package:riverpod_guide/domain/products/i_products_repository.dart';
import 'package:riverpod_guide/domain/products/product.dart';
import 'package:riverpod_guide/infrastructure/products/products_dto.dart';

class ProductRepository implements IProductRepository {
  final BaseHttpClient _client;

  ProductRepository(this._client);

  @override
  Future<Either<NetworkException, List<Product>>> getAllProducts(
    PaginationParams params,
  ) async {
    final response = await _client.get('/products', queryParams: {
      "skip": params.page,
      "limit": params.limit,
    });
    return response.fold(
      (error) => left(error),
      (response) => right(ProductsDto.fromJson(response)
              .products
              ?.map((e) => e.toDomain())
              .toList() ??
          []),
    );
  }
}
