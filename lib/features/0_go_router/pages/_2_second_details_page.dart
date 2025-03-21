import 'package:flutter/material.dart';
import '../../../core/ui/widgets/text_widget.dart';

class SecondDetailsPage extends StatelessWidget {
  const SecondDetailsPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('Second Details', TextType.titleSmall),
      ),
      body: Center(child: TextWidget('your id: $id', TextType.headlineMedium)),
    );
  }
}
