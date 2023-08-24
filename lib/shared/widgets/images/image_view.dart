// Flutter imports:
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  const ImageView(
    this.src, {
    super.key,
  });

  final String src;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      src,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        final percentageInDouble = (loadingProgress.cumulativeBytesLoaded) /
            (loadingProgress.expectedTotalBytes ?? 100);
        return Center(
          child: CircularProgressIndicator(
            value: percentageInDouble,
          ),
        );
      },
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        return child;
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: Colors.grey,
          child: Column(
            children: [
              const Icon(Icons.warning),
              Text(error.toString()),
            ],
          ),
        );
      },
    );
  }
}
