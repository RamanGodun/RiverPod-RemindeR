import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import '../models/enums.dart';

/// 📦 Local storage instance
final _storage = GetStorage();

/// 🚀 Provider for managing and persisting selected `AppFeature`
final featureProvider = StateNotifierProvider<FeatureNotifier, AppFeature>((
  ref,
) {
  return FeatureNotifier();
});

class FeatureNotifier extends StateNotifier<AppFeature> {
  FeatureNotifier() : super(_loadFeatureFromStorage());

  /// 🔽 Load saved feature from local storage on init
  static AppFeature _loadFeatureFromStorage() {
    final savedFeature = _storage.read<String>('selectedFeature');
    return AppFeature.values.firstWhere(
      (e) => e.name == savedFeature,
      orElse: () => AppFeature.simpleProvider,
    );
  }

  /// 🔄 Update feature and save to local storage
  void updateFeature(AppFeature newFeature) {
    state = newFeature;
    _storage.write('selectedFeature', newFeature.name);
  }
}
