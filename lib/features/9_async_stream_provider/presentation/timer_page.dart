import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/domain/utils_and_services/helpers.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/timer/timer_provider.dart';
import '../domain/timer/timer_state.dart';

part 'buttons_for_timer.dart';

/// 🕒 Page displaying a timer powered by `Stream` + `AsyncNotifier`
class Page4TimerOnStreamProvider extends StatelessWidget {
  const Page4TimerOnStreamProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Timer on async stream provider'),
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimerValue(), // Timer display
            ActionButtons(), // Start, Pause, Resume, Reset
          ],
        ),
      ),
    );
  }
}

/// ⏱ Widget to display the formatted timer value
class TimerValue extends ConsumerWidget {
  const TimerValue({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerProvider);
    debugPrint(timerState.toString());

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
