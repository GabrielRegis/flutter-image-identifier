import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_image_identifier/flutter_image_identifier_method_channel.dart';

void main() {
  MethodChannelFlutterImageIdentifier platform = MethodChannelFlutterImageIdentifier();
  const MethodChannel channel = MethodChannel('flutter_image_identifier');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
