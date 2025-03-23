import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/domain/providers/dio_and_retrofit/api_client_provider.dart';
import 'model/user.dart';

final userDetailsFutureProviderWithoutCodeGen = FutureProvider.autoDispose.family<
  User,
  int
>((ref, id) async {
  ref.onDispose(() {
    print('[userDetailsFutureProviderWithoutCodeGen($id)] disposed');
  });

  /*
  // Fetch details of a specific user by ID using dioProvider
  final response = await ref.watch(dioProvider).get('/users/$id');
  // Parse the response and convert it into a User object
  final user = User.fromJson(response.data);
 */

  final apiClient = ref.watch(apiClientProvider);
  // Виклик Retrofit методу
  final user = await apiClient.getUser(id);

  // ! dioProvider is autoDisposed, so this provider must also be autoDisposed.
  // !!! Alternatively, you can use "ref.keepAlive();" to cache the data and avoid disposal.
  ref.keepAlive(); // This will keep the data in memory for future use.

  return user;
});
