import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/domain/utils_and_services/helpers.dart';
import '../../../core/ui/widgets/buttons/custom_button_4_go_router.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../../../core/domain/config/router/auth_state_provider.dart';
import '../../../core/domain/config/router/route_names.dart';

class ThirdPage extends ConsumerWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Third page',
        isCenteredTitle: true,
        isNeedPaddingAfterActionIcon: true,
        actionIcons: const [Icons.output_outlined],
        actionCallbacks: [() => _handleSignOut(ref)],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: <Widget>[
            const TextWidget('This is the Third page', TextType.titleMedium),
            const SizedBox(height: 10),

            ///
            CustomButtonForGoRouter(
              title: 'To third branch subtree page',
              voidCallBack: () => _handleViewThirdDetails(context),
            ),

            ///
            const CustomButtonForGoRouter(
              title: 'Try to "SignIn" one more time',
              routeName: RouteNames.signIn,
            ),
          ],
        ),
      ),
    );
  }

  // Method to handle navigation to third details page
  void _handleViewThirdDetails(BuildContext context) {
    Helpers.goTo(
      context,
      RouteNames.thirdDetails,

      /*
     ! Recommendations:
   * 1. Use pathParameters:
      • To identify a resource.
      • When parameters are required for the route.
   * 2. Use queryParameters:
      • For optional parameters.
      • To filter, sort, and pass additional data.
   */
      ///
      pathParameters: {'id': 'UI375238'},
      queryParameters: {
        // 'firstName': 'Respectfull', // ? You can uncomment this to check
        'lastName': 'Developer',
      },
    );
  }

  // Method to handle sign out
  Future<void> _handleSignOut(WidgetRef ref) async {
    await ref.read(authStateProvider.notifier).setAuthenticate(false);
  }
}
