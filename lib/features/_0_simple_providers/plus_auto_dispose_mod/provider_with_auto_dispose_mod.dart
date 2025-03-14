import 'package:flutter_riverpod/flutter_riverpod.dart';

final autoDisposedProvider = Provider.autoDispose<String>((ref) {
  print('Simple [autoDisposedProvider] was created');
  ref.onDispose(() {
    print('Simple [autoDisposedProvider] was disposed');
  });
  return 'Text from Provider with autodisposed modification and without code generation';
});

/*
 This provider (with auto dispose) is automatically created when needed
 and disposed as soon as no widget is using it.
! AutoDisposed Provider uses when there is no need of data cashing (when content of page doesn't change frequently/often )

 Use this provider for temporary data or state that
 does not need to persist throughout the entire app run.

 It is ideal for cases where you want to free up resources
 when the data is no longer in use, such as loading states,
 temporary views, or components with short lifecycles.

 When all consumers of this provider stop listening to it,
 the provider is disposed of, freeing any associated memory and resources.
 */
