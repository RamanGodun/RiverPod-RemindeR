import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dio_provider.dart';
import 'model/user.dart';

part 'users_providers_gen.g.dart';

@riverpod
FutureOr<List<User>> userList(Ref ref) async {
  // Set up a dispose callback to track when the provider is disposed
  ref.onDispose(() {
    print('[userListProvider] disposed');
  });

  // Fetch the list of users from the API using the dioProvider
  final response = await ref.watch(dioProvider).get('/users');

  // ! dioProvider is autoDisposed, so this provider must also be autoDisposed
  // !!! OR we can use "ref.keepAlive();" to cache the data, preventing automatic disposal.
  // ref.keepAlive(); // Uncomment if you want to keep the data alive for caching purposes.

  // For testing error handling, you can uncomment the following line:
  // throw 'Failed to fetch user list';

  // Parse the response and convert it into a list of User objects
  final List userList = response.data;
  final users = [for (final user in userList) User.fromJson(user)];

  return users; // Return the list of users
}

@riverpod
FutureOr<User> userDetail(Ref ref, int id) async {
  // Set up a dispose callback to track when the provider is disposed
  ref.onDispose(() {
    print('[userDetailProvider($id)] disposed');
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

  // Parse the response and convert it into a User object
  final user = User.fromJson(response.data);

  return user; // Return the user details
}
