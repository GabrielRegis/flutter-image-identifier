import 'package:flutter/material.dart';
import 'package:flutter_image_identifier_example/features/theme/stores/current_theme_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeButton extends ConsumerWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeStore = ref.read(currentThemeStoreProvider.notifier);
    final theme = ref.watch(currentThemeStoreProvider);
    return IconButton(
      icon: Icon(
        themeStore.isDarkMode ? Icons.light_mode : Icons.dark_mode,
        size: 24,
      ),
      onPressed: themeStore.toggleTheme,
      color: Colors.white,
      tooltip: themeStore.isDarkMode ? "Light mode" : "Dark mode",
    );
  }
}
