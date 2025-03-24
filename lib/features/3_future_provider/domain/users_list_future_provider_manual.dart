import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/domain/providers/dio_and_retrofit/dio_providers/user_list_api/users_list_dio_provider.dart';
import 'model/user.dart';

final userListFutureProviderWithoutCodeGen =
    FutureProvider.autoDispose<List<User>>((ref) async {
      ref.onDispose(() {
        debugPrint('[userListFutureProviderWithoutCodeGen] disposed');
      });

      // Fetch the list of users from the API using dioProvider
      final response = await ref.watch(usersListDioProvider).get('/users');

      // ? For testing error handling, you can uncomment the following line:
      // throw 'Fail to fetch user list';

      // Parse the response and convert it into a list of User objects
      final List userList = response.data;
      final users = [for (final user in userList) User.fromJson(user)];

      return users;
    });
