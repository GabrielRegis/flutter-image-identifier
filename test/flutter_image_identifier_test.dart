import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_image_identifier/flutter_image_identifier.dart';
import 'package:flutter_image_identifier/flutter_image_identifier_platform_interface.dart';
import 'package:flutter_image_identifier/flutter_image_identifier_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterImageIdentifierPlatform
    with MockPlatformInterfaceMixin
    implements FlutterImageIdentifierPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterImageIdentifierPlatform initialPlatform = FlutterImageIdentifierPlatform.instance;

  test('$MethodChannelFlutterImageIdentifier is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterImageIdentifier>());
  });

  test('getPlatformVersion', () async {
    FlutterImageIdentifier flutterImageIdentifierPlugin = FlutterImageIdentifier();
    MockFlutterImageIdentifierPlatform fakePlatform = MockFlutterImageIdentifierPlatform();
    FlutterImageIdentifierPlatform.instance = fakePlatform;

    expect(await flutterImageIdentifierPlugin.getPlatformVersion(), '42');
  });
}
