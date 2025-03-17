import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/domain/app_constants/app_constants.dart';
import '../../../core/ui/widgets/mini_widgets.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/user_details_future_provider_gen.dart'; // In case of code generation
// import '../providers/users_providers.dart'; // In case we don't use code generation

class UserDetailPage extends ConsumerWidget {
  final int userId;
  const UserDetailPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetails = ref.watch(
      withCodeGenerationUserDetailsProvider(userId),
    );

    return Scaffold(
      appBar: const CustomAppBar(title: 'User Detail'),
      body: userDetails.when(
        data: (user) {
          final List<(IconData, String)> userInfoList = [
            (Icons.account_circle, user.username),
            (Icons.email_rounded, user.email),
            (Icons.phone_enabled, user.phone),
            (Icons.web_rounded, user.website),
          ];
          return RefreshIndicator(
            onRefresh: () => _refreshUserDetails(ref),
            color: AppConstants.errorColor,
            child: _buildUserInfoList(userInfoList, user.name),
          );
        },
        // In case of error, display the error widget
        error: (e, st) => AppMiniWidgets(MWType.error, error: e),
        // Show loading indicator while data is being fetched
        loading: () => const AppMiniWidgets(MWType.loading),
      ),
    );
  }

  Future<void> _refreshUserDetails(WidgetRef ref) {
    // RefreshIndicator triggers a refresh of the userDetailProvider using its future.
    // This ensures the UI will fetch updated data asynchronously.
    return ref.refresh(withCodeGenerationUserDetailsProvider(userId).future);
  }
}

Widget _buildUserInfoList(List<(IconData, String)> userInfoList, String name) {
  return Center(
    child: ListView.builder(
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(left: 55, right: 20, bottom: 200, top: 50),
      itemCount: userInfoList.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Column(
            children: [
              TextWidget(name, TextType.headlineSmall),
              const Divider(),
            ],
          );
        } else {
          final (icon, info) = userInfoList[index - 1];
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _buildUserInfo(icon, info),
          );
        }
      },
    ),
  );
}

Widget _buildUserInfo(IconData iconData, String userInfo) {
  return Row(
    spacing: 10,
    children: [Icon(iconData), TextWidget(userInfo, TextType.titleSmall)],
  );
}
