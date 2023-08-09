// Flutter imports:
import 'package:flutter/material.dart';

class LabelIconHorizontal extends StatelessWidget {
  const LabelIconHorizontal({
    super.key,
    required this.label,
    this.iconData,
    this.iconSize = 16.0,
    this.iconColor = Colors.black,
    this.customIcon,
  });

  final String label;
  final IconData? iconData;
  final double iconSize;
  final Color iconColor;
  final Widget? customIcon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Row(
      children: [
        Text(
          label,
          style: theme.labelSmall,
        ),
        const SizedBox(width: 4.0),
        if (iconData != null)
          Icon(iconData, size: iconSize, color: iconColor)
        else
          customIcon ?? Container(),
      ],
    );
  }
}
