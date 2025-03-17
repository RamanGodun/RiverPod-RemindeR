import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/domain/state/dio_and_retrofit/dio_provider.dart';
import 'model/user.dart';

part 'user_details_future_provider_gen.g.dart';

@riverpod
FutureOr<User> withCodeGenerationUserDetails(Ref ref, int id) async {
  ref.onDispose(() {
    print('[withCodeGenerationUserDetail($id)] disposed');
  });

  // Fetch the details of a specific user by ID
  final response = await ref.watch(dioProvider).get('/users/$id');

  // ! dioProvider is autoDisposed, so this provider should also be autoDisposed.
  // !!! OR we can use "ref.keepAlive();" to cache the data and avoid disposal.
  ref.keepAlive(); // This keeps the data alive, allowing it to be cached.

  /*
  autoDispose + ref.keepAlive() pattern:
  - If the data is successfully fetched, it gets cached.
  - If an error occurs, it tries fetching again (without caching the error state).

  If "ref.keepAlive();" is placed before the data fetching, the data will be fetched
  in the background, even if the user navigates away from the page before the data is fetched.

  Before using `keepAlive`: If the user navigates to a page, and data isn't fetched yet,
  then immediately navigates away, the provider will be disposed.

  After using `keepAlive`: If the data is fetched at least once, it will be cached, even if the provider is disposed.

  ? Difference between "keepAlive: true" option:
  - `keepAlive: true` ensures that the provider stays alive indefinitely,
    whereas `ref.keepAlive()` only keeps the data alive until it is next needed and accessed.
  */

  // return parsed and converted response  into a User object
  return User.fromJson(response.data);
}
