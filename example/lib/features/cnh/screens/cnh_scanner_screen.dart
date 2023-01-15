import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_identifier/features/cnh/models/cnh.dart';
import 'package:flutter_image_identifier/features/cnh/widgets/cnh_scanner.dart';
import 'package:flutter_image_identifier_example/features/cnh/stores/current_scanned_cnh.dart';
import 'package:flutter_image_identifier_example/features/cnh/widgets/cnh_card.dart';
import 'package:flutter_image_identifier_example/features/generics/widgets/app_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CNHScannerScreen extends ConsumerWidget {
  const CNHScannerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentCNH = ref.watch(currentScannedCNHStoreProvider);
    final currentCNHStore = ref.read(currentScannedCNHStoreProvider.notifier);

    return AppScreen(
      title: "Your CNH",
      child: Center(
        child: currentCNH.when(
          data: (cnh) {
            if (cnh != null) {
              return ZoomIn(
                child: Padding(
                  key: const Key("Padding"),
                  padding: const EdgeInsets.all(16),
                  child: CNHCard(cnh),
                ),
              );
            }
            return CNHScanner(
              key: const Key("Scanner"),
              onScanned: currentCNHStore.updateCurrentScannedCNH,
            );
          },
          error: (o, s) {},
          loading: () => LoadingAnimationWidget.twistingDots(
            leftDotColor: const Color(0xFF9362F9),
            rightDotColor: const Color(0xFFEA3799),
            size: 30,
          ),
        ),
      ),
    );
  }
}
