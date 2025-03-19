import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticker_provider.g.dart';

// * IF NOT want use code generation, then uncomment next:
// final tickerProvider = StreamProvider<int>((ref) {
//   ref.onDispose(() {
//     print('[tickerProvider] disposed');
//   });
//   return Stream.periodic(const Duration(seconds: 1), (t) => t + 1).take(60);
// });

@riverpod
Stream<int> ticker(Ref ref) {
  ref.onDispose(() {
    print('[tickerProvider] disposed');
  });
  return Stream.periodic(const Duration(seconds: 1), (t) => t + 1).take(60);
}
