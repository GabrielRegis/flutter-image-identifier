import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_image_identifier_platform_interface.dart';

/// An implementation of [FlutterImageIdentifierPlatform] that uses method channels.
class MethodChannelFlutterImageIdentifier extends FlutterImageIdentifierPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_image_identifier');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
