import 'package:flutter/material.dart';
import 'package:riverpod_reminder/core/presentation/widgets/custom_app_bar.dart';
import '../../../core/presentation/widgets/buttons/custom_button.dart';
import 'products_page_with_infinite_scroll_pagination.dart';
import 'products_page_with_number_pagination.dart';

class PaginationPage extends StatelessWidget {
  const PaginationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Providers lifecycle page'),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 30,
          children: [
            ///
            CustomButton(
              title: 'to ProductsPageWithPagination',
              child: ProductsPageWithPagination(),
            ),

            CustomButton(
              title: 'to ProductsPageWithNumberPagination',
              child: ProductsPageWithNumberPagination(),
            ),

            ///
          ],
        ),
      ),
    );
  }
}
