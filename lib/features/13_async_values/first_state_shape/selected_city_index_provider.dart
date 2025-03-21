import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

final selectedCityIndexProvider = StateProvider<int>((ref) => 1);

// @riverpod
// class SelectedCityIndex extends _$SelectedCityIndex {
//   @override
//   int build() => 1;

//   void reset() => state = 1;

//   void increment() => state++;
// }
