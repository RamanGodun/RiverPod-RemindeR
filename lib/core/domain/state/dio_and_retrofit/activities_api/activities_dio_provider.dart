import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

part 'activities_dio_provider.g.dart';

@riverpod
Dio activitiesDio(Ref ref) {
  return Dio(BaseOptions(baseUrl: 'https://bored-api.appbrewery.com/filter'));
}
