import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_identifier_example/features/generics/widgets/navbar.dart';
import 'package:flutter_image_identifier_example/features/theme/stores/current_theme_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppScreen extends ConsumerWidget {
  final Widget? child;
  final String? title;
  const AppScreen({super.key, this.child, this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(currentThemeStoreProvider);
    return CupertinoPageScaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: theme.backgroundColor,
      navigationBar: AppNavbar(
        title: title,
      ),
      child: child ?? SizedBox(),
    );
  }
}
