import 'package:flutter/material.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/ui/widgets/text_widget.dart';

class SecondDetailsPage extends StatelessWidget {
  const SecondDetailsPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Second subtree page',
        isCenteredTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 50,
          children: [
            const TextWidget(
              'This page belongs to the second branch in the navigation tree (second subtree).\n'
              'The data (pathParameters & queryParameters) was passed \nvia GoRouter.',
              isTextOnFewStrings: true,
              TextType.titleMedium,
            ),
            TextWidget('Your id: $id', TextType.headlineMedium),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
