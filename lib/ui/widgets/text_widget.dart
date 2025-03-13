import 'package:flutter/material.dart';
import '../../domain/app_constants/app_constants.dart';

/// 📄 **[TextWidget]** - Гнучкий текстовий віджет з інтеграцією теми та розширеними стилями.
class TextWidget extends StatelessWidget {
  final String? text;
  final TextType? textType;
  final Color? color;
  final TextAlign? alignment;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? letterSpacing;
  final double? height;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool enableShadow; // Додає м'яку тінь до тексту

  const TextWidget(
    this.text,
    this.textType, {
    super.key,
    this.color,
    this.alignment,
    this.fontWeight,
    this.fontSize,
    this.letterSpacing,
    this.height,
    this.overflow,
    this.maxLines,
    this.enableShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    /// 🛠 **Метод для побудови стилізованого тексту.**
    Text buildText(TextStyle? baseStyle) {
      return Text(
        text ?? 'No text provided',
        textAlign: alignment ?? TextAlign.center,
        maxLines: maxLines,
        overflow: overflow ?? TextOverflow.ellipsis,
        style: baseStyle?.copyWith(
          color: color ?? Theme.of(context).colorScheme.onSurface,
          fontWeight: fontWeight ?? baseStyle.fontWeight,
          fontSize: fontSize ?? baseStyle.fontSize,
          letterSpacing: letterSpacing ?? baseStyle.letterSpacing,
          height: height ?? baseStyle.height,
          fontFamily: 'SFProText',
          shadows: enableShadow
              ? [
                  Shadow(
                    blurRadius: 2.0,
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(1, 1),
                  )
                ]
              : null,
        ),
      );
    }

    /// 🎯 **Вибір стилю тексту залежно від [TextType]**
    switch (textType) {
      case TextType.displayLarge:
        return buildText(textTheme.displayLarge);
      case TextType.displayMedium:
        return buildText(textTheme.displayMedium);
      case TextType.displaySmall:
        return buildText(textTheme.displaySmall);
      case TextType.headlineLarge:
        return buildText(textTheme.headlineLarge);
      case TextType.headlineMedium:
        return buildText(textTheme.headlineMedium);
      case TextType.headlineSmall:
        return buildText(textTheme.headlineSmall);
      case TextType.titleLarge:
        return buildText(textTheme.titleLarge);
      case TextType.titleMedium:
        return buildText(textTheme.titleMedium);
      case TextType.titleSmall:
        return buildText(textTheme.titleSmall);
      case TextType.bodyLarge:
        return buildText(textTheme.bodyLarge);
      case TextType.bodyMedium:
        return buildText(textTheme.bodyMedium);
      case TextType.bodySmall:
        return buildText(textTheme.bodySmall);
      case TextType.labelLarge:
        return buildText(textTheme.labelLarge);
      case TextType.labelMedium:
        return buildText(textTheme.labelMedium);
      case TextType.labelSmall:
        return buildText(textTheme.labelSmall);
      case TextType.button:
        return buildText(textTheme.labelLarge);
      case TextType.error:
        return buildText(
          textTheme.bodyLarge?.copyWith(color: AppConstants.errorColor),
        );
      default:
        return buildText(textTheme.bodyMedium);
    }
  }
}

/// 📑 **[TextType]** - Розширений перелік стилів для [TextWidget].
enum TextType {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
  button,
  error,
}
