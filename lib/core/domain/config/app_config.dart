class AppConfig {
  static const bool isUsingCodeGeneration = true;
  static const bool isUsingStateNotifierProvider = true;

  static String get currentProviderType =>
      isUsingStateNotifierProvider ? 'State Notifier' : 'Change Notifier';
}
