import 'package:flutter/cupertino.dart';
import 'package:flutter_image_identifier_example/features/generics/typography/app_text.dart';
import 'package:flutter_image_identifier_example/features/theme/stores/current_theme_store.dart';
import 'package:flutter_image_identifier_example/features/theme/widgets/theme_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppNavbar extends ConsumerWidget
    implements ObstructingPreferredSizeWidget {
  final String? title;
  const AppNavbar({super.key, this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(currentThemeStoreProvider);
    return CupertinoNavigationBar(
      backgroundColor: theme.navbarColor.withOpacity(.6),
      trailing: const ThemeButton(),
      middle: Stack(
        children: [
          AppTypography.classy(
            title ?? "",
            size: 20,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(0, 50);

  @override
  bool shouldFullyObstruct(BuildContext context) {
    return false;
  }
}
