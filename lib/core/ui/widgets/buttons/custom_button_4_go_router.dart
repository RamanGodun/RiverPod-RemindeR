import 'package:flutter/cupertino.dart';

import '../../../domain/utils_and_services/helpers.dart';
import '../text_widget.dart';

/// 🪟🌍 **CustomButtonForGoRouter**
class CustomButtonForGoRouter extends StatelessWidget {
  final String title;
  final String? routeName;
  final Map<String, String>? pathParameters;
  final Map<String, dynamic>? queryParameters;
  final VoidCallback? voidCallBack;

  const CustomButtonForGoRouter({
    super.key,
    required this.title,
    this.routeName,
    this.pathParameters,
    this.queryParameters,
    this.voidCallBack,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Helpers.getColorScheme(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6.0),
      child: SizedBox(
        width: double.infinity,
        child: CupertinoButton(
          onPressed: () => _buttonOnPressed(context),
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
          borderRadius: BorderRadius.circular(11),
          color: colorScheme.primary.withOpacity(0.6),
          child: TextWidget(
            title,
            TextType.titleMedium,
            color: colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }

  void _buttonOnPressed(BuildContext context) {
    if (voidCallBack != null) {
      voidCallBack!();
    } else if (routeName != null && routeName!.isNotEmpty) {
      Helpers.goTo(
        context,
        routeName!,
        pathParameters: pathParameters ?? const {},
        queryParameters: queryParameters ?? const {},
      );
    } else {
      debugPrint('Error: routeName is null or empty.');
    }
  }
}

/*
?alternative way:
 if (voidCallBack != null) {
      voidCallBack!();
    } else if (routeName != null && routeName!.isNotEmpty) {
      Helpers.goTo(
        context,
        routeName!,
        pathParameters: pathParameters ?? const {},
        queryParameters: queryParameters ?? const {},
      );
    } else {
      debugPrint('Error: routeName is null or empty.');
    }
 */
