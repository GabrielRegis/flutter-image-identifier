import 'package:flutter/material.dart';
import 'package:flutter_image_identifier_example/features/theme/models/app_theme_colors.dart';
import 'package:flutter_image_identifier_example/features/theme/models/app_theme_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'light_theme_provider.g.dart';

@riverpod
AppThemeData lightThemeData(LightThemeDataRef ref) {
  return AppThemeData(
    brightness: Brightness.light,
    colors: AppThemeColors(
      background: Colors.white,
      navbar: const Color(0xFF9362F9),
      primary: const Color(0XFF183F47),
    ),
  );
}
