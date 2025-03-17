// api_client.dart
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../../../../features/2_future_provider/domain/model/user.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/users/{id}')
  Future<User> getUser(@Path('id') int id);
}
