import '../config/app_config.dart';

// Імпортуємо обидва варіанти
import '../../../features/_0_simple_providers/basic_provider/basic_provider.dart'
    as manual;
import '../../../features/_0_simple_providers/basic_provider/basic_provider_gen.dart'
    as generated;

// Імпортуємо обидва варіанти автодиспозних провайдерів
import '../../../features/_0_simple_providers/plus_auto_dispose_mod/provider_with_auto_dispose_mod_gen.dart'
    as generated_simple_auto_dispose;
import '../../../features/_0_simple_providers/plus_auto_dispose_mod/provider_with_auto_dispose_mod.dart'
    as manual_simple_auto_dispose;

/// 🏗 **Вибір провайдерів залежно від `AppConfig.isUsingCodeGeneration`**
final appBarProvider =
    AppConfig.isUsingCodeGeneration
        ? generated.appBarProvider
        : manual.appBarProvider;

final bodyTextProvider =
    AppConfig.isUsingCodeGeneration
        ? generated.bodyTextProvider
        : manual.bodyTextProvider;

/// 🏗 **Вибір автодиспозного провайдера залежно від `AppConfig.isUsingCodeGeneration`**
final autoDisposedProvider =
    AppConfig.isUsingCodeGeneration
        ? generated_simple_auto_dispose.autoDisposedProvider
        : manual_simple_auto_dispose.autoDisposedProvider;
