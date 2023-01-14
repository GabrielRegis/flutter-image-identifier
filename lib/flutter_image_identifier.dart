
import 'flutter_image_identifier_platform_interface.dart';

class FlutterImageIdentifier {
  Future<String?> getPlatformVersion() {
    return FlutterImageIdentifierPlatform.instance.getPlatformVersion();
  }
}
