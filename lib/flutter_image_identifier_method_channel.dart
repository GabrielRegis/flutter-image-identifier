import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_identifier/features/cnh/models/cnh.dart';

import 'flutter_image_identifier_platform_interface.dart';

/// An implementation of [FlutterImageIdentifierPlatform] that uses method channels.
class MethodChannelFlutterImageIdentifier
    extends FlutterImageIdentifierPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_image_identifier');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<CNH?> captureCNHInformationsFromImage(String base64) async {
    final cnhInfosEncodedString = await methodChannel.invokeMethod<String>(
      "captureCNHInformationsFromImage",
      base64,
    );
    if (cnhInfosEncodedString != null) {
      final cnh = CNH.fromEncodedJson(
        cnhInfosEncodedString,
      );
      return cnh;
    }
    return null;
  }
}
