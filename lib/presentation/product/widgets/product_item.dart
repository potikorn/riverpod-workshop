import 'package:flutter/material.dart';
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
    return Card(
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
    );
  }
}
