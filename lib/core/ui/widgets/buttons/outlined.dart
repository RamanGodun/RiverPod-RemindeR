import 'package:flutter/material.dart';
import 'package:riverpod_reminder/core/domain/utils_and_services/helpers.dart';
import '../text_widget.dart';

/// 🔘 **[CustomOutlinedButton]** - A reusable, stylish outlined button.
/// - Supports custom text, colors, and padding.
/// - Uses `OutlinedButton` with smooth rounded borders.
class CustomOutlinedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed; // 👈 Дозволяємо null
  final Color? textColor;
  final Color? borderColor;
  final EdgeInsets? padding;
  final double borderRadius;
  final double? width;
  final double? height;

  const CustomOutlinedButton({
    super.key,
    required this.buttonText,
    this.onPressed, // 👈 Тепер не обов'язково передавати значення
    this.textColor,
    this.borderColor,
    this.padding,
    this.borderRadius = 12.0,
    this.width,
    this.height,
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
        onPressed: onPressed, // ✅ Тепер може бути null
        style: OutlinedButton.styleFrom(
          foregroundColor: textColor ?? primaryColor,
          side: BorderSide(color: borderColor ?? primaryColor),
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
          color: textColor ?? primaryColor,
        ),
      ),
    );
  }
}
