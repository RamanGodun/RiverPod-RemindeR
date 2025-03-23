/// 🌐 Represents the status of fetching an Activity
enum ActivityStatus {
  initial, // Before fetching
  loading, // While fetching
  success, // Fetched successfully
  failure, // Fetch failed
}

/// 🏙️ Available city options
enum Cities { kyiv, ternopil, rivne, lviv }

/// 🚀 All available app features
enum AppFeature {
  simpleProvider,
  stateProvider,
  futureProvider,
  streamProvider,
  stateOrChangeNotifier,
  notifierProvider,
  asyncProvider,
  asyncNotifierProvider,
  asyncStreamProvider,
  providersLifecycle,
  optimization,
  pagination,
  asyncValues;

  /// 📌 Convert enum to readable label
  String get label {
    switch (this) {
      case AppFeature.simpleProvider:
        return "Simple Provider";
      case AppFeature.stateProvider:
        return "State Provider";
      case AppFeature.futureProvider:
        return "Future Provider";
      case AppFeature.streamProvider:
        return "Stream Provider";
      case AppFeature.stateOrChangeNotifier:
        return "State/Change Notifier";
      case AppFeature.notifierProvider:
        return "Notifier Provider";
      case AppFeature.asyncProvider:
        return "Async Provider";
      case AppFeature.asyncNotifierProvider:
        return "Async Notifier Provider";
      case AppFeature.asyncStreamProvider:
        return "Async Stream Provider";
      case AppFeature.providersLifecycle:
        return "Providers Lifecycle";
      case AppFeature.optimization:
        return "Optimization";
      case AppFeature.pagination:
        return "Pagination";
      case AppFeature.asyncValues:
        return "Async Values";
    }
  }

  /// 🔁 Convert String to enum safely
  static AppFeature fromString(String value) {
    return AppFeature.values.firstWhere(
      (e) => e.label == value,
      orElse: () => AppFeature.simpleProvider,
    );
  }
}
