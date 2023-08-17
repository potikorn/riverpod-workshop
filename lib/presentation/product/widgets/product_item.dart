// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
// Project imports:
import 'package:riverpod_guide/application/cart/cart_provider.dart';
import 'package:riverpod_guide/domain/products/product.dart';
import 'package:riverpod_guide/presentation/product/widgets/label_icon_horizontal.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.item,
  });

  final Product item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Image.network(
                      item.thumbnail,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          item.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          LabelIconHorizontal(
                            label: item.stock.toString(),
                            iconData: Icons.archive_outlined,
                            iconColor: Colors.green.shade700,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                            child: Text("•"),
                          ),
                          LabelIconHorizontal(
                            label: item.rating.toString(),
                            iconData: Icons.star,
                            iconColor: Colors.yellow.shade700,
                          ),
                        ],
                      ),
                      Text(item.getPriceFormatted()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final cartNotifier = ref.read(cartStateNotifierProvider.notifier);
            return Positioned(
              bottom: 4.0,
              right: 4.0,
              child: IconButton(
                onPressed: () => cartNotifier.addToCart(item),
                icon: const Icon(Icons.add_shopping_cart),
              ),
            );
          },
        ),
      ],
    );
  }
}
