import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'api_client.dart';
import 'dio_providers/user_list_api/users_list_dio_provider.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  final dio = ref.watch(usersListDioProvider);
  return ApiClient(dio);
});
