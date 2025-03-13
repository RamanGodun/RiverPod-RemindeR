import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_reminder/domain/app_constants/app_constants.dart';
import '../../domain/utils_and_services/helpers.dart';
import 'text_widget.dart';

/// 🎨 **CustomButton** - Кнопка у стилі macOS/iOS з гласморфізмом
class CustomButton extends StatelessWidget {
  final String title;
  final Widget child;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.title,
    required this.child,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Helpers.getColorScheme(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: colorScheme.primary.withOpacity(0.5),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withOpacity(0.15),
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: CupertinoButton(
        onPressed: onPressed ?? () => Helpers.pushTo(context, child),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
        borderRadius: BorderRadius.circular(12),
        color: Colors.transparent,
        child:
            TextWidget(title, TextType.titleMedium, color: AppConstants.white),
      ),
    );
  }
}

/// 🪟 **CustomButtonForDialog** - Кнопка для відкриття діалогового вікна у стилі macOS
class CustomButtonForDialog extends StatelessWidget {
  final String title;
  final Widget child;

  const CustomButtonForDialog({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: CupertinoButton(
        onPressed: () => showDialog(
          context: context,
          builder: (c) {
            return child;
          },
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white.withOpacity(0.3),
        child: TextWidget(title, TextType.button, color: Colors.black),
      ),
    );
  }
}

/// 🌍 **CustomButtonForGoRouter** - Кнопка для навігації через GoRouter
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6.0),
      child: SizedBox(
        width: double.infinity,
        child: CupertinoButton(
          onPressed: () => _buttonOnPressed(context),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white.withOpacity(0.3),
          child: TextWidget(title, TextType.button, color: Colors.black),
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
