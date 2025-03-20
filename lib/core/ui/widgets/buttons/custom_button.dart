import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_reminder/core/domain/app_constants/app_constants.dart';
import '../../../domain/utils_and_services/helpers.dart';
import '../text_widget.dart';

/// 🎨 **CustomButton**
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
        child: TextWidget(
          title,
          TextType.titleMedium,
          color: AppConstants.white,
        ),
      ),
    );
  }
}
