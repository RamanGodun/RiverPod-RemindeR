import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import '../models/enums.dart';

/// 📦 Локальне сховище для збереження стану
final _storage = GetStorage();

/// 🏗 Провайдер для збереження та оновлення `AppFeature`
final featureProvider =
    StateNotifierProvider<FeatureNotifier, AppFeature>((ref) {
  return FeatureNotifier();
});

class FeatureNotifier extends StateNotifier<AppFeature> {
  FeatureNotifier() : super(_loadFeatureFromStorage());

  /// 🚀 **Завантаження вибраної фічі при старті**
  static AppFeature _loadFeatureFromStorage() {
    final savedFeature = _storage.read<String>('selectedFeature');
    return AppFeature.values.firstWhere(
      (e) => e.name == savedFeature,
      orElse: () => AppFeature.simpleProvider,
    );
  }

  /// 🔄 **Оновлення стану та збереження у GetStorage**
  void updateFeature(AppFeature newFeature) {
    state = newFeature;
    _storage.write('selectedFeature', newFeature.name);
  }
}
