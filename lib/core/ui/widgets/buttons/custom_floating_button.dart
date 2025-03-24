import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final double size;
  final EdgeInsetsGeometry padding;

  const CustomFloatingButton({
    super.key,
    required this.onPressed,
    this.icon = Icons.add,
    this.size = 26,
    this.padding = const EdgeInsets.only(bottom: 77, right: 12),
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: padding,
      child: FloatingActionButton(
        backgroundColor: colorScheme.primary.withOpacity(0.7),
        onPressed: onPressed,
        child: Icon(icon, size: size, color: colorScheme.onPrimary),
      ),
    );
  }
}
