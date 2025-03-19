import 'package:flutter/material.dart';
import '../../../core/ui/widgets/text_widget.dart';
import 'action_buttons.dart';
import '../timer/timer_value.dart';

class StreamTimerPresentation extends StatelessWidget {
  const StreamTimerPresentation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('Stream Timer', TextType.titleMedium),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [TimerValue(), SizedBox(height: 20), ActionButtons()],
        ),
      ),
    );
  }
}
