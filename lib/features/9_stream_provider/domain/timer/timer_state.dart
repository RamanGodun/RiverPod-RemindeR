/// Represents the base class for all timer states.
sealed class TimerState {
  final int duration;
  const TimerState(this.duration);
}

/// ⏱ Initial state before the timer starts.
final class TimerInitial extends TimerState {
  const TimerInitial(super.duration);

  @override
  String toString() => 'TimerInitial(duration: $duration)';
}

/// ▶️ Active countdown state.
final class TimerRunning extends TimerState {
  const TimerRunning(super.duration);

  @override
  String toString() => 'TimerRunning(duration: $duration)';
}

/// ⏸ Timer is paused, retaining current [duration].
final class TimerPaused extends TimerState {
  const TimerPaused(super.duration);

  @override
  String toString() => 'TimerPaused(duration: $duration)';
}

/// 🛑 Countdown is complete.
final class TimerFinished extends TimerState {
  const TimerFinished() : super(0);

  @override
  String toString() => 'TimerFinished()';
}
