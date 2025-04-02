import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/storage/app_storage_pod.dart';

///This provider stores the ThemeModeController
final themePod = NotifierProvider.autoDispose<ThemeModeController, ThemeMode>(
  ThemeModeController.new,
);

///This controller class used change theme and
///get the intial theme from storage if its available
class ThemeModeController extends AutoDisposeNotifier<ThemeMode> {
  final _themeKey = "theme";

  @override
  ThemeMode build() {
    final theme = ref.watch(appStoragePod).get(key: _themeKey);
    if (theme != null) {
      if (theme == ThemeMode.light.name) {
        return ThemeMode.light;
      } else if (theme == ThemeMode.dark.name) {
        return ThemeMode.dark;
      }
      return ThemeMode.system;
    }
    return ThemeMode.system;
  }

  Future<void> changeTheme(ThemeMode theme) async {
    state = theme;
    await ref.read(appStoragePod).put(key: _themeKey, value: theme.name);
  }
}
