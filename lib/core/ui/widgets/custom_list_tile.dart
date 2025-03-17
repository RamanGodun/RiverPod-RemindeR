import 'package:flutter/material.dart';

import 'text_widget.dart';

class AppListTile extends StatelessWidget {
  final Widget leading;
  final String title;

  const AppListTile({
    super.key,
    required this.leading,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: TextWidget(title, TextType.titleMedium),
    );
  }
}
