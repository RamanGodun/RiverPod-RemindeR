import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'ticker_for_timer.dart';
import 'timer_state.dart';

part 'timer_provider.g.dart';

/// ⏱️ Timer provider using [AsyncNotifier] and [Stream]-based ticking.
@riverpod
class Timer extends _$Timer {
  final int _duration = 35; // Initial countdown duration in seconds.
  final TickerForTimer _ticker =
      const TickerForTimer(); // Emits ticks per second.
  StreamSubscription<int>?
  _tickerSubscription; // Stream subscription for managing tick updates.

  @override
  Stream<TimerState> build() {
    ref.onDispose(() {
      debugPrint('[timerProvider] disposed');
      // Clean up the stream subscription on disposal.
      _tickerSubscription?.cancel();
    });

    // Emits the initial timer state.
    return Stream.value(TimerInitial(_duration));
  }

  /// ▶️ Starts the countdown timer from the initial duration.
  void startTimer() {
    state = AsyncData(TimerRunning(_duration));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker.tick(ticks: _duration).listen((duration) {
      state =
          duration > 0
              ? AsyncData(TimerRunning(duration))
              : const AsyncData(TimerFinished());
    });
  }

  /// ⏸ Pauses the active timer and updates the state to [TimerPaused].
  void pauseTimer() {
    switch (state.value!) {
      case TimerRunning(:int duration):
        _tickerSubscription?.pause();
        state = AsyncData(TimerPaused(duration));
      case _:
    }
  }

  /// 🔄 Resumes a paused timer and updates the state to [TimerRunning].
  void resumeTimer() {
    switch (state.value!) {
      case TimerPaused(:int duration):
        _tickerSubscription?.resume();
        state = AsyncData(TimerRunning(duration));
      case _:
    }
  }

  /// ❌ Cancels the active timer and resets the state to [TimerInitial].
  void resetTimer() {
    _tickerSubscription?.cancel();
    state = AsyncData(TimerInitial(_duration));
  }
}
