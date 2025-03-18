import 'package:flutter/material.dart';
import 'package:riverpod_reminder/core/domain/utils_and_services/helpers.dart';
import 'text_widget.dart';

class AppListTile extends StatelessWidget {
  final int id;
  final String title;

  const AppListTile({super.key, required this.id, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Helpers.getColorScheme(context).secondary,
        child: TextWidget(id.toString(), TextType.titleSmall),
      ),
      title: TextWidget(
        title,
        TextType.titleMedium,
        alignment: TextAlign.start,
      ),
    );
  }
}
