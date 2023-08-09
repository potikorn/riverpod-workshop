// Package imports:
import 'package:fpdart/fpdart.dart';

// Project imports:
import 'package:riverpod_guide/application/config/network/error_exception.dart';
import 'package:riverpod_guide/application/product/product_list_provider.dart';
import 'product.dart';

abstract class IProductRepository {
  Future<Either<NetworkException, List<Product>>> getAllProducts(
    PaginationParams params,
  );
}
