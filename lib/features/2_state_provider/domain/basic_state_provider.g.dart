// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$clickedTimesHash() => r'1b1ae6679f3f1cb63cfab17e87b2094dfea20dc2';

/// See also [clickedTimes].
@ProviderFor(clickedTimes)
final clickedTimesProvider = Provider<int>.internal(
  clickedTimes,
  name: r'clickedTimesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$clickedTimesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ClickedTimesRef = ProviderRef<int>;
String _$counterHash() => r'60e485a3496f34c62a7006e8c1a94b9964fd4956';

/// 🏗 **StateProvider for managing an integer state of counter**.
/// ? 📀 **CD-RW analogy**: This provider acts like a **rewritable CD-RW**, meaning its value can be changed dynamically using: ref.read(counterProvider.notifier).state++;
///
/// Copied from [Counter].
@ProviderFor(Counter)
final counterProvider = AutoDisposeNotifierProvider<Counter, int>.internal(
  Counter.new,
  name: r'counterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$counterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Counter = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
