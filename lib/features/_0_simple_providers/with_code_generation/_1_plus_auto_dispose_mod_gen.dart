import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '_1_plus_auto_dispose_mod_gen.g.dart';

@riverpod
String autoDisposed(Ref ref) {
  print('[autoDisposedProvider] was created');

  ref.onDispose(() {
    print('[autoDisposedProvider] was disposed');
  });

  return 'auto Disposed Provider';
}

/*
 This provider is automatically created when needed
 and disposed as soon as no widget is using it.

 Use this provider for temporary data or state that
 does not need to persist throughout the entire app run.

 It is ideal for cases where you want to free up resources
 when the data is no longer in use, such as loading states,
 temporary views, or components with short lifecycles.

 When all consumers of this provider stop listening to it,
 the provider is disposed of, freeing any associated memory and resources.
 */
