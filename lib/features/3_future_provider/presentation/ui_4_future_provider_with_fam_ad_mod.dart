import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/ui/widgets/buttons/outlined.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/domain/config/app_config.dart';
import '../domain/model/user.dart';
import '../domain/user_details_future_provider_gen.dart';
import '../domain/user_details_future_provider_manual.dart';

class FutureProviderWithFamilyAutoDisposeMode extends ConsumerWidget {
  const FutureProviderWithFamilyAutoDisposeMode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watching multiple instances of userDetailProvider (for user 1 and user 2)
    final userDetailsProvider1 = getUserDetailsProviderInstance(1);
    final userDetailsProvider2 = getUserDetailsProviderInstance(2);
    ref.watch(userDetailsProvider1);
    ref.watch(userDetailsProvider2);

    return Scaffold(
      appBar: const CustomAppBar(
        title:
            '${AppConfig.isUsingCodeGeneration ? 'Gen' : 'Manual'} future provider with FAD mod',
      ),

      ///
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            CustomOutlinedButton(
              buttonText: 'Invalidate user\'s providers',
              // ❗️ Invalidate ALL instances of family provider
              onPressed:
                  () =>
                      ref.invalidate(getUserDetailsFamilyProvider() as Family),
            ),

            const SizedBox(height: 20),

            CustomOutlinedButton(
              buttonText: 'Refresh provider with id=1',
              // 🔄 Refresh specific instance (user id = 1)
              onPressed: () => ref.refresh(userDetailsProvider1),
            ),
          ],
        ),
      ),
    );
  }

  /// 🌱 Returns specific instance of userDetailsProvider (for userId)
  AutoDisposeFutureProvider<User> getUserDetailsProviderInstance(int id) {
    return AppConfig.isUsingCodeGeneration
        ? withCodeGenerationUserDetailsProvider(id)
        : userDetailsFutureProviderWithoutCodeGen(id);
  }

  /// 🪄 Returns the whole family provider (for invalidating all instances)
  ProviderOrFamily getUserDetailsFamilyProvider() {
    return AppConfig.isUsingCodeGeneration
        ? withCodeGenerationUserDetailsProvider
        : userDetailsFutureProviderWithoutCodeGen;
  }
}
