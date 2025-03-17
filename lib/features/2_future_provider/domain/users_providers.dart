import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dio_provider.dart';
import 'model/user.dart';

// futureProvider => Use autocompletion to generate the provider
final userListProvider = FutureProvider.autoDispose<List<User>>((ref) async {
  // Set up a dispose callback to track when the provider is disposed
  ref.onDispose(() {
    print('[userListProvider] disposed');
  });

  // Fetch the list of users from the API using dioProvider
  final response = await ref.watch(dioProvider).get('/users');

  // ! dioProvider is autoDisposed, so this provider must also be autoDisposed.
  // If not autoDisposed, the data may be unnecessarily kept in memory after it's no longer needed.

  // For testing error handling, you can uncomment the following line:
  // throw 'Fail to fetch user list';

  // Parse the response and convert it into a list of User objects
  final List userList = response.data;
  final users = [for (final user in userList) User.fromJson(user)];

  return users; // Return the list of users
});

final userDetailProvider = FutureProvider.autoDispose.family<User, int>((
  ref,
  id,
) async {
  // Set up a dispose callback to track when the provider is disposed
  ref.onDispose(() {
    print('[userDetailProvider($id)] disposed');
  });

  // Fetch details of a specific user by ID using dioProvider
  final response = await ref.watch(dioProvider).get('/users/$id');

  // ! dioProvider is autoDisposed, so this provider must also be autoDisposed.
  // !!! Alternatively, you can use "ref.keepAlive();" to cache the data and avoid disposal.
  ref.keepAlive(); // This will keep the data in memory for future use.

  // Parse the response and convert it into a User object
  final user = User.fromJson(response.data);

  return user; // Return the user details
});
