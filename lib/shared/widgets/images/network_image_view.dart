// Flutter imports:
import 'package:flutter/material.dart';

class NetworkImageView extends StatelessWidget {
  const NetworkImageView(this.src, {super.key});

  final String src;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      image: NetworkImage(src),
      imageErrorBuilder: (context, error, stackTrace) {
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
      placeholder: const AssetImage('assets/images/logo/brand_cover.png'),
      fit: BoxFit.cover,
      placeholderFit: BoxFit.contain,
    );
  }
}
