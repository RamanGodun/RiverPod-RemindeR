import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/users_providers_gen.dart'; // In case of code generation
// import '../providers/users_providers.dart'; // In case we don't use code generation

class FamilyDisposePage extends ConsumerWidget {
  const FamilyDisposePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watching multiple instances of userDetailProvider (for user 1 and user 2)
    ref.watch(userDetailProvider(1));
    ref.watch(userDetailProvider(2));

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('Family Dispose', TextType.titleMedium),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          shrinkWrap: true,
          children: [
            OutlinedButton(
              // Invalidate the entire family of providers (for all instances)
              // By calling invalidate without arguments, we dispose all family providers
              onPressed: () => ref.invalidate(userDetailProvider),
              // OR, we can dispose a specific instance of the family provider
              // onPressed: () => ref.invalidate(userDetailProvider(2)),
              child: const TextWidget('Invalidate', TextType.titleMedium),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              // Refresh a specific instance of the family provider (in this case, user 1)
              // This re-executes the provider logic and fetches fresh data
              onPressed: () => ref.refresh(userDetailProvider(1)),
              child: const TextWidget('Refresh', TextType.titleMedium),
            ),
          ],
        ),
      ),
    );
  }
}
