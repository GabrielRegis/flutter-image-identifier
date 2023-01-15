import 'package:flutter/material.dart';
import 'package:flutter_image_identifier_example/features/theme/models/app_theme_colors.dart';
import 'package:flutter_image_identifier_example/features/theme/models/app_theme_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'dark_theme_provider.g.dart';

@riverpod
AppThemeData darkThemeData(DarkThemeDataRef ref) {
  return AppThemeData(
    brightness: Brightness.dark,
    colors: AppThemeColors(
      background: const Color(0XFF161616),
      navbar: Color.fromARGB(255, 16, 13, 24),
      primary: const Color(0XFF183F47),
    ),
  );
}
