import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shared_preferences/shared_preferences.dart';

part 'shared_pref_provider.g.dart';

@riverpod
SharedPreferences sharedPreferences(Ref ref) {
  throw UnimplementedError();
}

/*
next used only  for optimization, when  initialization of Synch Provider for Async APIs and 
! need to specify dependencies

@Riverpod(dependencies: [])
SharedPreferences sharedPreferences(Ref ref) {
  throw UnimplementedError();
}

 */
