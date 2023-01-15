import 'features/cnh/models/cnh.dart';
import 'flutter_image_identifier_platform_interface.dart';

class FlutterImageIdentifier {
  Future<String?> getPlatformVersion() {
    return FlutterImageIdentifierPlatform.instance.getPlatformVersion();
  }

  Future<CNH?> captureCNHInformationsFromImage(String base64) {
    return FlutterImageIdentifierPlatform.instance
        .captureCNHInformationsFromImage(
      base64,
    );
  }
}
