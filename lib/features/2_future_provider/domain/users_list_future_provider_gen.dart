import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/domain/state/dio_and_retrofit/user_list_api/users_list_dio_provider.dart';
import 'model/user.dart';

part 'users_list_future_provider_gen.g.dart';

@riverpod
Future<List<User>> withCodeGenerationUserList(Ref ref) async {
  ref.onDispose(() {
    print('[withCodeGenerationUserList] disposed');
  });

  // Fetch the list of users from the API using the dioProvider
  final response = await ref.watch(usersListDioProvider).get('/users');

  // For testing error handling, you can uncomment the following line:
  // throw 'Failed to fetch user list';

  // Parse the response and convert it into a list of User objects
  final List userList = response.data;
  final users = [for (final user in userList) User.fromJson(user)];

  // ! dioProvider is autoDisposed, so this provider must also be autoDisposed
  // !!! OR we can use "ref.keepAlive();" to cache the data, preventing automatic disposal.
  // ref.keepAlive(); // Uncomment if you want to keep the data alive for caching purposes.

  return users;
}
