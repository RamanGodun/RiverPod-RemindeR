import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: const TextWidget('Third Details', TextType.titleMedium),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(
              'Your ID: $id\n($firstName $lastName)',
              TextType.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
