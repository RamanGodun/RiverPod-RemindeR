import 'package:flutter/material.dart';

import '../text_widget.dart';

class CustomFloatingButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final double size;
  final EdgeInsetsGeometry padding;
  final bool isExtended;

  const CustomFloatingButton({
    super.key,
    required this.onPressed,
    this.icon = Icons.add,
    this.size = 26,
    this.padding = const EdgeInsets.only(bottom: 77, right: 12),
    this.isExtended = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return isExtended
        ? Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: FloatingActionButton.extended(
            backgroundColor: colorScheme.primary.withOpacity(0.5),
            onPressed: onPressed,
            label: TextWidget(
              'New Activity',
              TextType.titleMedium,
              color: colorScheme.onPrimary,
            ),
          ),
        )
        : Padding(
          padding: padding,
          child: FloatingActionButton(
            backgroundColor: colorScheme.primary.withOpacity(0.7),
            onPressed: onPressed,
            child: Icon(icon, size: size, color: colorScheme.onPrimary),
          ),
        );
  }
}
