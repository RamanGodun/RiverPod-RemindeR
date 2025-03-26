part of 'timer_page.dart';

/// 🎛 Displays control buttons based on current [TimerState]
class ActionButtons extends ConsumerWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(timerProvider);

    // Don't render anything while loading or error
    if (state is! AsyncData) {
      return const SizedBox.shrink();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Dynamically render buttons based on current timer state
        ...switch (state.value!) {
          /// ▶ Show "Start" when in initial state
          TimerInitial() => [
            FloatingActionButton(
              heroTag: 'start timer',
              onPressed: () => ref.read(timerProvider.notifier).startTimer(),
              child: const Icon(Icons.play_arrow),
            ),
          ],

          /// ⏸ + 🔁 Show "Pause" and "Reset" during running
          TimerRunning() => [
            FloatingActionButton(
              heroTag: 'pause timer',
              onPressed: () => ref.read(timerProvider.notifier).pauseTimer(),
              child: const Icon(Icons.pause),
            ),
            FloatingActionButton(
              heroTag: 'reset timer',
              onPressed: () => ref.read(timerProvider.notifier).resetTimer(),
              child: const Icon(Icons.replay),
            ),
          ],

          /// ▶ + 🔁 Show "Resume" and "Reset" when paused
          TimerPaused() => [
            FloatingActionButton(
              heroTag: 'resume timer',
              onPressed: () => ref.read(timerProvider.notifier).resumeTimer(),
              child: const Icon(Icons.play_arrow),
            ),
            FloatingActionButton(
              heroTag: 'reset timer',
              onPressed: () => ref.read(timerProvider.notifier).resetTimer(),
              child: const Icon(Icons.replay),
            ),
          ],

          /// 🔁 Show only "Reset" when finished
          TimerFinished() => [
            FloatingActionButton(
              heroTag: 'reset timer',
              onPressed: () => ref.read(timerProvider.notifier).resetTimer(),
              child: const Icon(Icons.replay),
            ),
          ],
        },
      ],
    );
  }
}
