import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///This class defines light theme and dark theme
///Here we used flex color scheme
class AppThemes {
  static ThemeData get theme => FlexThemeData.light(
        // Using FlexColorScheme built-in FlexScheme enum based colors
        scheme: FlexScheme.shadRed,
        // Component theme configurations for light mode.
        subThemesData: const FlexSubThemesData(
          interactionEffects: true,
          tintedDisabledControls: true,
          useM2StyleDividerInM3: true,
          inputDecoratorIsFilled: true,
          inputDecoratorBorderType: FlexInputBorderType.outline,
          alignedDropdown: true,
          navigationRailUseIndicator: true,
        ),
        // Direct ThemeData properties.
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
      );
  static ThemeData get darkTheme => FlexThemeData.dark(
        // Using FlexColorScheme built-in FlexScheme enum based colors.
        scheme: FlexScheme.shadRed,
        // Component theme configurations for dark mode.
        subThemesData: const FlexSubThemesData(
          interactionEffects: true,
          tintedDisabledControls: true,
          blendOnColors: true,
          useM2StyleDividerInM3: true,
          inputDecoratorIsFilled: true,
          inputDecoratorBorderType: FlexInputBorderType.outline,
          alignedDropdown: true,
          navigationRailUseIndicator: true,
        ),
        // Direct ThemeData properties.
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
      );
}
