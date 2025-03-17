import 'package:flutter/material.dart';
import 'package:riverpod_reminder/core/domain/utils_and_services/helpers.dart';
import '../text_widget.dart';

/// 🔘 **[CustomOutlinedButton]** - A reusable, stylish outlined button.
/// - Supports disabling, custom text, colors, and padding.
/// - Uses `OutlinedButton` with smooth rounded borders.
class CustomOutlinedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  final Color? textColor;
  final Color? borderColor;
  final EdgeInsets? padding;
  final double borderRadius;
  final double? width;
  final double? height;
  final bool disabled; // 🔥 NEW PARAMETER!

  const CustomOutlinedButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.textColor,
    this.borderColor,
    this.padding,
    this.borderRadius = 12.0,
    this.width,
    this.height,
    this.disabled = false, // default enabled
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Helpers.getColorScheme(context);
    final primaryColor = colorScheme.primary;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: width ?? double.infinity,
      height: height,
      child: OutlinedButton(
        onPressed:
            disabled
                ? null // якщо disabled → не натискається
                : () {
                  onPressed?.call(); // викликаємо лише якщо не null
                },
        style: OutlinedButton.styleFrom(
          foregroundColor:
              disabled
                  ? Colors
                      .grey // змінюємо колір, коли disabled
                  : textColor ?? primaryColor,
          side: BorderSide(
            color: disabled ? Colors.grey : borderColor ?? primaryColor,
          ),
          padding:
              padding ??
              const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: TextWidget(
          buttonText,
          TextType.titleMedium,
          color: disabled ? Colors.grey : textColor ?? primaryColor,
        ),
      ),
    );
  }
}
