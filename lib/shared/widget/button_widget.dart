import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  // Core properties
  final VoidCallback? onPressed;
  final String text;
  final Widget? child; // Alternative to text for custom content

  // Behavior
  final VoidCallback? onLongPress;
  final bool enabled;
  final FocusNode? focusNode;
  final bool autofocus;

  // Appearance
  final Color? backgroundColor;
  final Color? foregroundColor; // For text/icon color
  final Color? disabledBackgroundColor;
  final Color? disabledForegroundColor;
  final BorderRadiusGeometry? borderRadius;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final Size? minimumSize;
  final Size? maximumSize;
  final BorderSide? borderSide; // For border customization

  // Text styling
  final TextStyle? textStyle;
  final TextAlign? textAlign;

  // Icon support
  final Widget? icon; // Leading icon
  final Widget? trailingIcon; // Trailing icon

  // Animation and interaction
  final Duration? animationDuration;
  final Curve? animationCurve;
  final WidgetStateProperty<MouseCursor?>? mouseCursor;

  const ButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
    this.child,
    this.onLongPress,
    this.enabled = true,
    this.focusNode,
    this.autofocus = false,
    this.backgroundColor,
    this.foregroundColor,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
    this.borderRadius,
    this.elevation = 4.0,
    this.padding,
    this.minimumSize = const Size(double.infinity, 50),
    this.maximumSize,
    this.borderSide,
    this.textStyle,
    this.textAlign,
    this.icon,
    this.trailingIcon,
    this.animationDuration,
    this.animationCurve,
    this.mouseCursor,
  });

  // Helper method to build button style with theme-aware defaults
  ButtonStyle _buildButtonStyle(BuildContext context) {
    final theme = Theme.of(context);
    final defaultBackgroundColor = theme.primaryColor;
    final defaultForegroundColor = theme.colorScheme.onPrimary;

    return ButtonStyle(
      // Shape and border
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.zero,
          side: borderSide ?? BorderSide.none,
        ),
      ),
      // Elevation
      elevation: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) return 0.0;
        if (states.contains(WidgetState.pressed)) {
          return elevation != null ? elevation! * 0.5 : 2.0;
        }
        return elevation ?? 4.0;
      }),
      // Background color
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return disabledBackgroundColor ??
              theme.disabledColor.withValues(alpha: 0.12);
        }
        if (states.contains(WidgetState.pressed)) {
          return backgroundColor?.darken(0.1) ?? theme.primaryColorDark;
        }
        return backgroundColor ?? defaultBackgroundColor;
      }),
      // Foreground color (text/icon)
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return disabledForegroundColor ??
              theme.disabledColor.withValues(alpha: 0.38);
        }
        return foregroundColor ?? defaultForegroundColor;
      }),
      // Padding
      padding: WidgetStateProperty.all(
          padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
      // Size constraints
      minimumSize: WidgetStateProperty.all(minimumSize),
      maximumSize: WidgetStateProperty.all(maximumSize),
      // Text style
      textStyle: WidgetStateProperty.resolveWith((states) {
        final baseStyle =
            textStyle ?? const TextStyle(fontWeight: FontWeight.bold);
        if (states.contains(WidgetState.pressed)) {
          return baseStyle.copyWith(fontSize: 20, letterSpacing: 1);
        }
        return baseStyle;
      }),
      // Animation
      animationDuration: animationDuration ?? const Duration(milliseconds: 200),
      mouseCursor: mouseCursor ?? WidgetStateMouseCursor.clickable,
    );
  }

  // Build the button child (text or custom widget with optional icons)
  Widget _buildChild() {
    if (child != null) {
      if (icon != null || trailingIcon != null) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              icon!,
              const SizedBox(width: 8),
            ],
            child!,
            if (trailingIcon != null) ...[
              const SizedBox(width: 8),
              trailingIcon!,
            ],
          ],
        );
      }
      return child!;
    }

    final textWidget = Text(
      text,
      style: textStyle ?? const TextStyle(fontWeight: FontWeight.bold),
      textAlign: textAlign,
    );

    if (icon != null || trailingIcon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            icon!,
            const SizedBox(width: 8),
          ],
          textWidget,
          if (trailingIcon != null) ...[
            const SizedBox(width: 8),
            trailingIcon!,
          ],
        ],
      );
    }
    return textWidget;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled ? onPressed : null,
      onLongPress: enabled ? onLongPress : null,
      focusNode: focusNode,
      autofocus: autofocus,
      style: _buildButtonStyle(context),
      child: _buildChild(),
    );
  }
}

// Extension to darken color for pressed state
extension ColorExtension on Color {
  Color darken(double amount) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }
}
