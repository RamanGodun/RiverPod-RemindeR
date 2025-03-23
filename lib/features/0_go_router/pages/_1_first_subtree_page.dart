import 'package:flutter/material.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/ui/widgets/buttons/custom_button_4_go_router.dart';
import '../../../core/ui/widgets/text_widget.dart';

class FirstDetailsPage extends StatefulWidget {
  const FirstDetailsPage({super.key});

  @override
  State<FirstDetailsPage> createState() => _FirstDetailsPageState();
}

class _FirstDetailsPageState extends State<FirstDetailsPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'First subtree page',
        isCenteredTitle: true,
      ),
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextWidget(
              'This page is under the first route branch (first subtree).',
              isTextOnFewStrings: true,
              TextType.titleMedium,
            ),
            TextWidget('$counter', TextType.headlineMedium),

            CustomButtonForGoRouter(
              title: 'Increment Counter',
              onPressedCallback: () => setState(() => counter++),
            ),
          ],
        ),
      ),
    );
  }
}
