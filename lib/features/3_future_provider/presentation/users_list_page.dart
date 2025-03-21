import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/domain/config/app_config.dart';
import '../../../core/domain/utils_and_services/helpers.dart';
import '../../../core/ui/widgets/custom_list_tile.dart';
import '../../../core/ui/widgets/mini_widgets.dart';
import '../domain/users_list_future_provider_gen.dart';
import '../domain/users_list_future_provider_manual.dart';
import 'user_details_page.dart';

class UserListPage extends ConsumerWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userList =
        AppConfig.isUsingCodeGeneration
            ? ref.watch(withCodeGenerationUserListProvider)
            : ref.watch(userListFutureProviderWithoutCodeGen);

    return Scaffold(
      appBar: CustomAppBar(
        title:
            'User List ${AppConfig.isUsingCodeGeneration ? 'gen' : 'manual'}',
        actionIcons: const [Icons.refresh],
        actionCallbacks: [
          () async {
            // Invalidate the provider to trigger a full rebuild and data refetch.
            ref.invalidate(
              AppConfig.isUsingCodeGeneration
                  ? withCodeGenerationUserListProvider
                  : userListFutureProviderWithoutCodeGen,
            );
          },
        ],
      ),

      body: userList.when(
        // `skipLoadingOnRefresh` set to false to show the loading indicator
        // during the refresh phase. Useful for visible feedback when using
        // AppBar refresh buttons (but not ideal with RefreshIndicator widget).
        skipLoadingOnRefresh: false,
        data: (users) {
          return ListView.separated(
            key: const PageStorageKey('UsersList'),
            // Always enable scrolling, even when the list is short.
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: users.length,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
            itemBuilder: (BuildContext context, int index) {
              final user = users[index];

              return GestureDetector(
                onTap:
                    () => Helpers.pushTo(
                      context,
                      UserDetailPage(userId: user.id),
                    ),
                child: AppListTile(id: user.id, title: user.name),
              );
            },
          );
        },
        error: (error, stTrace) => AppMiniWidgets(MWType.error, error: error),
        loading: () => const AppMiniWidgets(MWType.loading),
      ),
    );
  }
}

/*
  ALTERNATIVE SYNTAX using Dart 3 pattern matching.

  ✅ Fully equivalent to `.when(skipLoadingOnRefresh: false)` functionality.

  Main idea:
  - While refresh is ongoing, display previous data with a loading indicator at the top
    (exactly like skipLoadingOnRefresh: false behavior).
  - On initial load (first time), show CircularProgressIndicator or any loading widget.
  - Errors are handled similarly.

  Advantages:
  - More concise, modern syntax.
  - Full control over refresh, loading, error, and success states.
  - Clean switch-based pattern matching (widely adopted by top Dart/Flutter developers).

  Example:
*/

// body: switch (userList) {
//   // Case: Data loaded, currently refreshing
//   AsyncData(:final value) when userList.isRefreshing => Stack(
//     children: [
//       ListView.separated(
//         physics: const AlwaysScrollableScrollPhysics(),
//         itemCount: value.length,
//         separatorBuilder: (_, __) => const Divider(),
//         itemBuilder: (context, index) {
//           final user = value[index];
//           return GestureDetector(
//             onTap: () => Helpers.pushTo(
//               context,
//               UserDetailPage(userId: user.id),
//             ),
//             child: AppListTile(
//               leading: CircleAvatar(
//                 child: TextWidget(user.id.toString(), TextType.titleSmall),
//               ),
//               title: user.name,
//             ),
//           );
//         },
//       ),
//       // Show linear progress indicator at top during refresh (skipLoadingOnRefresh behavior)
//       const Positioned(
//         top: 0,
//         left: 0,
//         right: 0,
//         child: LinearProgressIndicator(),
//       ),
//     ],
//   ),

//   // Case: Data loaded, not refreshing
//   AsyncData(:final value) => ListView.separated(
//     physics: const AlwaysScrollableScrollPhysics(),
//     itemCount: value.length,
//     separatorBuilder: (_, __) => const Divider(),
//     itemBuilder: (context, index) {
//       final user = value[index];
//       return GestureDetector(
//         onTap: () => Helpers.pushTo(
//           context,
//           UserDetailPage(userId: user.id),
//         ),
//         child: AppListTile(
//           leading: CircleAvatar(
//             child: TextWidget(user.id.toString(), TextType.titleSmall),
//           ),
//           title: user.name,
//         ),
//       );
//     },
//   ),

//   // Case: Error
//   AsyncError(:final error, :final stackTrace) =>
//       AppMiniWidgets(MWType.error, error: error),

//   // Case: Initial loading
//   AsyncLoading() => const AppMiniWidgets(MWType.loading),
// }
