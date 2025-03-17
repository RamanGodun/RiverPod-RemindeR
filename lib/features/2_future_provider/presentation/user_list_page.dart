import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/domain/utils_and_services/helpers.dart';
import '../../../core/ui/widgets/custom_list_tile.dart';
import '../../../core/ui/widgets/mini_widgets.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/users_providers_gen.dart'; // In case of code generation
// import '../providers/users_providers.dart'; // In case we don't use code generation
import 'user_detail_page.dart';

class UserListPage extends ConsumerWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userList = ref.watch(userListProvider);

    /*
        General logging prints to track all states of the provider.
        This helps in understanding how states change during different phases (loading, refreshing, etc.).
        For example, when you refresh the page, you can see that loading state occurs while the data may still be available.
    */
    // print(
    //     'isLoading: ${userList.isLoading},     isRefreshing: ${userList.isRefreshing},     isReloading: ${userList.isReloading}');
    // print('hasValue: ${userList.hasValue},    hasError: ${userList.hasError}');
    // print(userList);

    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        actions: [
          IconButton(
            onPressed: () async {
              // Invalidate the provider to trigger a full rebuild and data refetch.
              ref.invalidate(userListProvider);
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: userList.when(
        // `skipLoadingOnRefresh` set to false to show the loading indicator
        // when refreshing the page. This is an appropriate UX choice when the refresh button
        // is in the AppBar, but may not be ideal for using with a `RefreshIndicator` widget.
        skipLoadingOnRefresh: false,
        data: (users) {
          return ListView.separated(
            // Necessary when using the `RefreshIndicator` widget to ensure scrolling is always available.
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: users.length,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
            itemBuilder: (BuildContext context, int index) {
              final user = users[index];

              return GestureDetector(
                onTap: () =>
                    Helpers.pushTo(context, UserDetailPage(userId: user.id)),
                child: AppListTile(
                  leading: CircleAvatar(
                    child: TextWidget(user.id.toString(), TextType.titleSmall),
                  ),
                  title: user.name,
                ),
              );
            },
          );
        },
        error: (error, stTrace) => AppMiniWidgets(MWType.error, error: error),
        loading: () => const AppMiniWidgets(MWType.loading),
      ),
      /*
        * ALTERNATIVE syntax
        * The following is an example of using `switch` with `AsyncValue`.
        * It demonstrates how to handle the different states of `userList`
        * using pattern matching for a more concise and readable approach.
      */
      // body: switch (userList) {
      //   // Accessing the data inside `AsyncData` using `value`
      //   AsyncData(:final value) => ListView.separated(
      //       itemCount: value.length,
      //       separatorBuilder: (BuildContext context, int index) {
      //         return const Divider();
      //       },
      //       itemBuilder: (BuildContext context, int index) {
      //         final user = value[index];

      //         return GestureDetector(
      //           onTap: () =>
      //               Helpers.pushTo(context, UserDetailPage(userId: user.id)),
      //           child: AppListTile(
      //             leading: CircleAvatar(
      //                 child: TextWidgets.headlineText(
      //                     context, user.id.toString())),
      //             title: user.name,
      //           ),
      //         );
      //       },
      //     ),
      //   AsyncError(:final error) => AppMiniWidgets.errorWidget(context, error),
      //   _ => AppMiniWidgets.loadingWidget(),
      // },
    );
  }
}
