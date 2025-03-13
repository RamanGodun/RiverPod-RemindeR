import 'package:flutter/material.dart';
import 'package:riverpod_reminder/ui/widgets/text_widget.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: TextWidget('Other page', TextType.bodyLarge),
      ),
    );
  }
}
