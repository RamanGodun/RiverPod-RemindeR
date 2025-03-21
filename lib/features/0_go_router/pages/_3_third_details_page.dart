import 'package:flutter/material.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/ui/widgets/text_widget.dart';

class ThirdDetailsPage extends StatelessWidget {
  const ThirdDetailsPage({
    super.key,
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  final String id;
  final String firstName;
  final String lastName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Third subtree page',
        isCenteredTitle: true,
      ),
      body: Center(
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(
              '$firstName $lastName',
              TextType.titleLarge,
              alignment: TextAlign.center,
            ),
            TextWidget('(account ID: $id)', TextType.bodyLarge),
            const SizedBox(height: 60),
            const TextWidget(
              'Switch between bottom navigation items \nand see how states are persistent!',
              TextType.titleSmall,
              isTextOnFewStrings: true,
              alignment: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
