import 'package:flutter/material.dart';

import '../../../widgets/custom_button.dart';
import '../../../widgets/text_widget.dart';

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
      appBar: AppBar(
        title: const TextWidget('First Details Page', TextType.titleSmall),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget('$counter', TextType.headline),
            const SizedBox(height: 20),
            CustomButtonForGoRouter(
              title: 'Increment Counter',
              voidCallBack: () => setState(
                () => counter++,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
