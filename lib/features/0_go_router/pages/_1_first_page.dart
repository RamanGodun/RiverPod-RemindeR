import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/domain/utils_and_services/helpers.dart';
import '../../../core/ui/_theming/theme_provider.dart';
import '../../../core/ui/widgets/buttons/custom_button_4_go_router.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../../../core/domain/config/router/route_names.dart';

class FirstPage extends ConsumerWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'First page',
        isCenteredTitle: true,
        isNeedPaddingAfterActionIcon: true,
        actionIcons: [isDarkMode ? Icons.dark_mode : Icons.light_mode],
        actionCallbacks: [() => Helpers.toggleTheme(context, ref)],
      ),
      body: const Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextWidget('This is First page', TextType.headlineSmall),

            CustomButtonForGoRouter(
              title: 'Go to first page\'s subtree',
              routeName: RouteNames.firstDetails,
            ),
          ],
        ),
      ),
    );
  }
}
