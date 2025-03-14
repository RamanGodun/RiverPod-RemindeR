/*
This enum represents the possible states that the Activity fetching process can be in.
It allows tracking whether the app is idle, loading data, has successfully loaded data,
or encountered a failure. This pattern provides a clean way to manage state transitions.
 */
enum ActivityStatus {
  initial, // The initial state before any data is fetched.
  loading, // State when the data is being fetched.
  success, // State when the data is successfully retrieved.
  failure, // State when the data fetching fails.
}

enum Cities {
  seoul,
  london,
  bangkok,
  tokyo,
}

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
  optimization,
  pagination,
  goRouter;

  /// 📌 Конвертація в String (для UI)
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
      case AppFeature.optimization:
        return "Optimization";
      case AppFeature.pagination:
        return "Pagination";
      case AppFeature.goRouter:
        return "Go Router";
    }
  }

  /// 📌 Конвертація String -> AppFeature
  static AppFeature fromString(String value) {
    return AppFeature.values.firstWhere(
      (e) => e.label == value,
      orElse: () => AppFeature.simpleProvider,
    );
  }
}
