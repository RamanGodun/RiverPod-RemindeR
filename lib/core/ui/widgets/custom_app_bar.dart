import 'package:flutter/material.dart';
import 'text_widget.dart';

/// 🎨 **[CustomAppBar] - Гнучкий AppBar з динамічними кнопками**
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? leadingIcon;
  final VoidCallback? onLeadingPressed;
  final List<IconData>? actionIcons;
  final List<VoidCallback>? actionCallbacks;

  const CustomAppBar({
    super.key,
    required this.title,
    this.leadingIcon,
    this.onLeadingPressed,
    this.actionIcons,
    this.actionCallbacks,
  });

  @override
  Widget build(BuildContext context) {
    if ((actionIcons?.length ?? 0) != (actionCallbacks?.length ?? 0)) {
      throw ArgumentError(
          'Довжина списку іконок і callback-ів має бути однакова.');
    }

    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(left: 35),
        child: TextWidget(title, TextType.titleMedium),
      ),
      leading: leadingIcon != null
          ? IconButton(icon: Icon(leadingIcon), onPressed: onLeadingPressed)
          : null,
      actions: [
        if (actionIcons != null && actionCallbacks != null)
          for (int i = 0; i < actionIcons!.length; i++)
            IconButton(
              icon: Icon(actionIcons![i]),
              onPressed: actionCallbacks![i],
            ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
