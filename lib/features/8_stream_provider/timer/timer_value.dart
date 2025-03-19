import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/domain/utils_and_services/helpers.dart';
import '../../../core/ui/widgets/text_widget.dart';
import 'timer_provider.dart';

class TimerValue extends ConsumerWidget {
  const TimerValue({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerProvider);
    print(timerState);

    return timerState.maybeWhen(
      data:
          (value) => TextWidget(
            Helpers.formatTimer(value.duration),
            TextType.headlineMedium,
          ),
      orElse: () => const SizedBox.shrink(),
    );
  }
}
