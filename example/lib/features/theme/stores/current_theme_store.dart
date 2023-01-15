import 'package:flutter/material.dart';
import 'package:flutter_image_identifier_example/features/theme/models/app_theme_data.dart';
import 'package:flutter_image_identifier_example/features/theme/providers/dark_theme_provider.dart';
import 'package:flutter_image_identifier_example/features/theme/providers/light_theme_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'current_theme_store.g.dart';

@Riverpod(keepAlive: true)
class CurrentThemeStore extends _$CurrentThemeStore {
  @override
  AppThemeData build() {
    return lightThemeData;
  }

  void toggleTheme() {
    state = isDarkMode ? lightThemeData : darkThemeData;
  }

  AppThemeData get lightThemeData => ref.read(lightThemeDataProvider);
  AppThemeData get darkThemeData => ref.read(darkThemeDataProvider);

  bool get isDarkMode => state.brightness == Brightness.dark;
}
