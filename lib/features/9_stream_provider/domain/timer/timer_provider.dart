import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'ticker.dart';
import 'timer_state.dart';

part 'timer_provider.g.dart';

@riverpod
class Timer extends _$Timer {
  final int _duration = 17;
  final Ticker _ticker = const Ticker();
  StreamSubscription<int>? _tickerSubscription;

  @override
  Stream<TimerState> build() {
    ref.onDispose(() {
      debugPrint('[timerProvider] disposed');
      _tickerSubscription?.cancel();
    });
    return Stream.value(TimerInitial(_duration));
  }

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

  void pauseTimer() {
    switch (state.value!) {
      case TimerRunning(:int duration):
        _tickerSubscription?.pause();
        state = AsyncData(TimerPaused(duration));
      case _:
    }
  }

  void resumeTimer() {
    switch (state.value!) {
      case TimerPaused(:int duration):
        _tickerSubscription?.resume();
        state = AsyncData(TimerRunning(duration));
      case _:
    }
  }

  void resetTimer() {
    _tickerSubscription?.cancel();
    state = AsyncData(TimerInitial(_duration));
  }
}
