import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../ui/widgets/text_widget.dart';
import '../../app_constants/app_constants.dart';
import '../helpers.dart';

/// 🌟 **[OverlayNotificationService] - A service for displaying animated overlay notifications.**
class OverlayNotificationService {
  static OverlayEntry? _overlayEntry;

  /// 📌 **Displays an overlay notification with an icon and message.**
  static void showOverlay(BuildContext context,
      {required String message, required IconData icon}) {
    _removeOverlay();

    final overlay = Overlay.of(context, rootOverlay: true);
    _overlayEntry = OverlayEntry(
      builder: (context) =>
          _AnimatedOverlayWidget(message: message, icon: icon),
    );

    overlay.insert(_overlayEntry!);
    Future.delayed(const Duration(seconds: 2), () => _removeOverlay());
  }

  /// 🛑 **Removes any existing overlay.**
  static void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

/// 🎭 **[_AnimatedOverlayWidget] - The animated UI widget for overlay notifications.**
class _AnimatedOverlayWidget extends HookWidget {
  final String message;
  final IconData icon;

  const _AnimatedOverlayWidget({required this.message, required this.icon});

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 500),
    )..forward();

    final opacity = animationController.drive(
      Tween<double>(begin: 0, end: 1).chain(CurveTween(curve: Curves.easeOut)),
    );

    final scale = animationController.drive(
      Tween<double>(begin: 0.9, end: 1)
          .chain(CurveTween(curve: Curves.easeOutBack)),
    );

    final colorScheme = Helpers.getColorScheme(context);
    final isDarkMode = colorScheme.brightness == Brightness.dark;

    return Stack(
      children: [
        Positioned(
          top: MediaQuery.of(context).size.height * 0.15,
          left: MediaQuery.of(context).size.width * 0.1,
          right: MediaQuery.of(context).size.width * 0.1,
          child: FadeTransition(
            opacity: opacity,
            child: ScaleTransition(
              scale: scale,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? AppConstants.black.withOpacity(0.7)
                        : AppConstants.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isDarkMode ? Colors.white38 : Colors.black26,
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppConstants.black.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(icon,
                          color: isDarkMode
                              ? AppConstants.white
                              : AppConstants.black,
                          size: 24),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextWidget(
                          message,
                          TextType.titleSmall,
                          color: isDarkMode
                              ? AppConstants.white
                              : AppConstants.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
