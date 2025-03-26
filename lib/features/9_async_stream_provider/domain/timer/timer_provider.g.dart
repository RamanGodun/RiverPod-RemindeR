// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$timerHash() => r'd43a17e5e9b8fb5290df065476d028576a8f2c6d';

/// ⏱️ Timer provider using [AsyncNotifier] and [Stream]-based ticking.
///
/// Copied from [Timer].
@ProviderFor(Timer)
final timerProvider =
    AutoDisposeStreamNotifierProvider<Timer, TimerState>.internal(
  Timer.new,
  name: r'timerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$timerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Timer = AutoDisposeStreamNotifier<TimerState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
