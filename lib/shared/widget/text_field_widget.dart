import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/shared/constant/app_defaults.dart';

class TextFieldWidget extends StatelessWidget {
  // Core text field properties
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final int maxLines;
  final int minLines;
  final String? initialValue;

  // Callbacks
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onTap;
  final Function(PointerDownEvent)? onTapOutside;

  // Validation and formatting
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final List<String>? autofillHints;
  final AutovalidateMode autovalidateMode;
  final int? maxLength;

  // Text styling
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextAlign textAlign;

  // Behavior
  final bool enabled;
  final bool readOnly;
  final bool obscureText;
  final bool autofocus;
  final bool enableSuggestions;
  final bool autocorrect;
  final TextCapitalization textCapitalization;
  final bool showCursor;
  final bool enableInteractiveSelection;

  // Cursor
  final Color? cursorColor;
  final double? cursorWidth;
  final Radius? cursorRadius;

  // Appearance
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? label;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final bool filled;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final BorderRadius? borderRadius;
  final String? helperText;
  final TextStyle? helperStyle;
  final String? errorText;
  final TextStyle? errorStyle;

  // Border properties
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? disabledBorderColor;
  final Color? enabledBorderColor;
  final Color? errorBorderColor;
  final Color? focusedErrorBorderColor;
  final double? borderWidth;

  const TextFieldWidget({
    super.key,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.maxLines = 1,
    this.minLines = 1,
    this.initialValue,
    this.onChanged,
    this.onFieldSubmitted,
    this.onSaved,
    this.onEditingComplete,
    this.onTap,
    this.onTapOutside,
    this.validator,
    this.inputFormatters,
    this.autofillHints,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.maxLength,
    this.textStyle,
    this.hintStyle,
    this.labelStyle,
    this.textAlign = TextAlign.start,
    this.enabled = true,
    this.readOnly = false,
    this.obscureText = false,
    this.autofocus = false,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.textCapitalization = TextCapitalization.none,
    this.showCursor = true,
    this.enableInteractiveSelection = true,
    this.cursorColor,
    this.cursorWidth = 2.0,
    this.cursorRadius,
    this.prefixIcon,
    this.suffixIcon,
    this.prefix,
    this.suffix,
    this.label,
    this.contentPadding,
    this.fillColor,
    this.filled = true,
    this.prefixIconColor,
    this.suffixIconColor,
    this.borderRadius,
    this.helperText,
    this.helperStyle,
    this.errorText,
    this.errorStyle,
    this.borderColor,
    this.focusedBorderColor,
    this.disabledBorderColor,
    this.enabledBorderColor,
    this.errorBorderColor,
    this.focusedErrorBorderColor,
    this.borderWidth,
  });

  // Helper method to create border with consistent styling
  OutlineInputBorder _buildBorder({
    required Color color,
    BorderRadius? radius,
    double? width,
  }) {
    return OutlineInputBorder(
      borderRadius: radius ?? BorderRadius.zero,
      borderSide: BorderSide(
        color: color,
        width: width ?? 1.0,
      ),
    );
  }

  // Build decoration with theme-aware defaults
  InputDecoration _buildDecoration(BuildContext context) {
    final theme = Theme.of(context);
    final defaultBorderColor = theme.dividerColor;
    final defaultIconColor = theme.colorScheme.primary;

    return InputDecoration(
      contentPadding: contentPadding ??
          EdgeInsets.symmetric(
            vertical: MediaQuery.sizeOf(context).height * 0.02,
            horizontal: MediaQuery.sizeOf(context).width * 0.03,
          ),
      fillColor: fillColor ?? theme.cardColor,
      filled: filled,
      label: label,
      labelStyle: labelStyle,
      prefixIcon: prefixIcon,
      prefixIconColor: prefixIconColor ?? defaultIconColor,
      suffixIcon: suffixIcon,
      suffixIconColor: suffixIconColor ?? defaultIconColor,
      prefix: prefix,
      suffix: suffix,
      hintText: hintText,
      hintStyle: hintStyle,
      helperText: helperText,
      helperStyle: helperStyle,
      errorText: errorText,
      errorStyle: errorStyle,
      disabledBorder: _buildBorder(
        color: disabledBorderColor ?? defaultBorderColor,
        radius: borderRadius,
        width: borderWidth,
      ),
      errorBorder: _buildBorder(
        color: errorBorderColor ?? defaultBorderColor,
        radius: borderRadius,
        width: borderWidth,
      ),
      focusedBorder: _buildBorder(
        color: focusedBorderColor ?? defaultBorderColor,
        radius: borderRadius,
        width: borderWidth,
      ),
      enabledBorder: _buildBorder(
        color: enabledBorderColor ?? defaultBorderColor,
        radius: borderRadius,
        width: borderWidth,
      ),
      focusedErrorBorder: _buildBorder(
        color: focusedErrorBorderColor ?? defaultBorderColor,
        radius: borderRadius,
        width: borderWidth,
      ),
      border: _buildBorder(
        color: borderColor ?? defaultBorderColor,
        radius: borderRadius,
        width: borderWidth,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      autovalidateMode: autovalidateMode,
      autofocus: autofocus,
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      initialValue: initialValue,
      onChanged: onChanged,
      onTapOutside: onTapOutside,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      onEditingComplete: onEditingComplete,
      obscureText: obscureText,
      readOnly: readOnly,
      enabled: enabled,
      autofillHints: autofillHints,
      validator: validator,
      inputFormatters: inputFormatters,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      style: textStyle,
      textAlign: textAlign,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
      textCapitalization: textCapitalization,
      showCursor: showCursor,
      cursorColor: cursorColor,
      cursorWidth: cursorWidth ?? 2.0,
      cursorRadius: cursorRadius,
      enableInteractiveSelection: enableInteractiveSelection,
      decoration: _buildDecoration(context),
    );
  }
}
