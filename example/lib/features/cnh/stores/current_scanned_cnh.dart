import 'package:flutter_image_identifier/features/cnh/models/cnh.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'current_scanned_cnh.g.dart';

@riverpod
class CurrentScannedCNHStore extends _$CurrentScannedCNHStore {
  @override
  Future<CNH?> build() async {
    return null;
  }

  void updateCurrentScannedCNH(CNH cnh) async {
    state = const AsyncValue.loading();
    await Future.delayed(const Duration(milliseconds: 1200));
    state = AsyncValue.data(
      cnh,
    );
  }
}
