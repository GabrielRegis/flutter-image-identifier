import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'features/cnh/models/cnh.dart';
import 'flutter_image_identifier_method_channel.dart';

abstract class FlutterImageIdentifierPlatform extends PlatformInterface {
  /// Constructs a FlutterImageIdentifierPlatform.
  FlutterImageIdentifierPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterImageIdentifierPlatform _instance =
      MethodChannelFlutterImageIdentifier();

  /// The default instance of [FlutterImageIdentifierPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterImageIdentifier].
  static FlutterImageIdentifierPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterImageIdentifierPlatform] when
  /// they register themselves.
  static set instance(FlutterImageIdentifierPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<CNH?> captureCNHInformationsFromImage(String base64) {
    throw UnimplementedError();
  }
}
