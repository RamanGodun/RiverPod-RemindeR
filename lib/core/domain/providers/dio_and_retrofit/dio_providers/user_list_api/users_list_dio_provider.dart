import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';
import '../../dio_interceptor.dart';

part 'users_list_dio_provider.g.dart';

/// 🌐 **[usersListDioProvider] - Provides configured Dio instance**
@riverpod
Dio usersListDio(Ref ref) {
  final dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));

  /// 🔗 Add custom interceptor for logging
  dio.interceptors.add(CustomInterceptor());

  return dio;
}

/* 
✨ Simple variant without interceptor:

@riverpod
Dio dio(Ref ref) => Dio(
  BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'),
);
*/
