import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

import 'dio_interceptor.dart';

// rivp => Use autocompletion for generating the provider part file
part 'dio_provider.g.dart';

@riverpod
Dio dio(Ref ref) {
  final dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));

  // Add the custom interceptor
  dio.interceptors.add(CustomInterceptor());

  return dio;
}

/*
@riverpod
Dio dio(Ref ref) {
  // Providing a Dio instance with base URL configuration
  // BaseOptions allows to configure default headers, timeout, and other settings.
  // This Dio instance can now be used for making HTTP requests across the app.
  return Dio(
    BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'),
  );
}

 */
