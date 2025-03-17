import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/ui/widgets/buttons/outlined.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../domain/user_details_future_provider_gen.dart'; // In case of code generation
// import '../providers/users_providers.dart'; // In case we don't use code generation

class FutureProviderWithFamilyAutoDisposeMode extends ConsumerWidget {
  const FutureProviderWithFamilyAutoDisposeMode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watching multiple instances of userDetailProvider (for user 1 and user 2)
    ref.watch(withCodeGenerationUserDetailsProvider(1));
    ref.watch(withCodeGenerationUserDetailsProvider(2));

    return Scaffold(
      appBar: const CustomAppBar(title: 'Family Dispose'),

      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            CustomOutlinedButton(
              buttonText: 'Invalidate',
              // ! Invalidate the entire family of providers (for all instances)
              // ! By calling invalidate without arguments, we dispose all family providers
              onPressed:
                  () => ref.invalidate(withCodeGenerationUserDetailsProvider),
              // ? OR, we can dispose a specific instance of the family provider
              // onPressed: () => ref.invalidate(withCodeGenerationUserDetailsProvider(2)),
            ),

            const SizedBox(height: 20),

            CustomOutlinedButton(
              buttonText: 'Refresh',
              // ! Refresh a specific instance of the family provider (in this case, user 1)
              // ! This re-executes the provider logic and fetches fresh data
              onPressed:
                  () => ref.refresh(withCodeGenerationUserDetailsProvider(1)),
            ),
          ],
        ),
      ),
    );
  }
}
