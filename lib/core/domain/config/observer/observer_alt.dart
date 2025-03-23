import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 📝 **[LoggerAlt]** - Custom ProviderObserver for logging provider lifecycle events.
class LoggerAlt extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    print('''
{
  "event": "Provider Initialized",
  "provider": "${provider.name ?? provider.runtimeType}",
  "value": "$value"
}
''');
    super.didAddProvider(provider, value, container);
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    print('''
{
  "event": "Provider Disposed",
  "provider": "${provider.name ?? provider.runtimeType}"
}
''');
    super.didDisposeProvider(provider, container);
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    print('''
{
  "event": "Provider Updated",
  "provider": "${provider.name ?? provider.runtimeType}",
  "previous value": "$previousValue",
  "new value": "$newValue"
}
''');
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }
}
