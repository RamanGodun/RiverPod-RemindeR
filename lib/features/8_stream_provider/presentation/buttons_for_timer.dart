part of 'timer_page.dart';

class ActionButtons extends ConsumerWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(timerProvider);

    if (state is! AsyncData) {
      return const SizedBox.shrink();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ...switch (state.value!) {
          ///
          TimerInitial() => [
            FloatingActionButton(
              heroTag: 'start timer',
              onPressed: () => ref.read(timerProvider.notifier).startTimer(),
              child: const Icon(Icons.play_arrow),
            ),
          ],

          ///
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

          ///
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

          ///
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
