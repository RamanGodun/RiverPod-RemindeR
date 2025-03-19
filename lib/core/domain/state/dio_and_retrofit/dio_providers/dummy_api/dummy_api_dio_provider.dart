import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dummy_api_dio_provider.g.dart';

@riverpod
Dio dummyApiDio(Ref ref) {
  return Dio(BaseOptions(baseUrl: 'https://dummyjson.com'));
}
