import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/domain/app_constants/app_constants.dart';
import '../../../core/ui/widgets/mini_widgets.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/users_providers_gen.dart'; // In case of code generation
// import '../providers/users_providers.dart'; // In case we don't use code generation

class UserDetailPage extends ConsumerWidget {
  final int userId;
  const UserDetailPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetail = ref.watch(userDetailProvider(userId));

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('User Detail', TextType.titleMedium),
      ),
      body: userDetail.when(
        data: (user) {
          final userInfoList = [
            {'icon': Icons.account_circle, 'info': user.username},
            {'icon': Icons.email_rounded, 'info': user.email},
            {'icon': Icons.phone_enabled, 'info': user.phone},
            {'icon': Icons.web_rounded, 'info': user.website},
          ];

          return RefreshIndicator(
            // RefreshIndicator triggers a refresh of the userDetailProvider using its future.
            // This ensures the UI will fetch updated data asynchronously.
            onRefresh: () => ref.refresh(userDetailProvider(userId).future),
            color: AppConstants.errorColor,
            child: Center(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 20,
                  bottom: 200,
                  top: 50,
                ),
                itemCount: userInfoList.length + 1,
                itemBuilder: (context, index) {
                  // First element shows the user's name and a divider
                  if (index == 0) {
                    return Column(
                      children: [
                        TextWidget(user.name, TextType.headlineSmall),
                        const Divider(),
                      ],
                    );
                  } else {
                    // Remaining items display the user details with icons
                    final userInfo = userInfoList[index - 1];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: UserInfo(
                        iconData: userInfo['icon'] as IconData,
                        userInfo: userInfo['info'] as String,
                      ),
                    );
                  }
                },
              ),
            ),
          );
        },
        // In case of error, display the error widget
        error: (e, st) => AppMiniWidgets(MWType.error, error: e),
        // Show loading indicator while data is being fetched
        loading: () => const AppMiniWidgets(MWType.loading),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  final IconData iconData;
  final String userInfo;
  const UserInfo({super.key, required this.iconData, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(iconData),
        const SizedBox(width: 10),
        Text(userInfo, style: theme.textTheme.titleMedium),
      ],
    );
  }
}
