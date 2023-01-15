import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_identifier/features/cnh/models/cnh.dart';
import 'package:flutter_image_identifier/features/cnh/widgets/cnh_frame.dart';
import 'package:flutter_image_identifier/features/generics/widgets/super_container.dart';
import 'package:flutter_image_identifier/flutter_image_identifier.dart';
import 'package:widget_mask/widget_mask.dart';

class CNHScanner extends StatefulWidget {
  final Function(CNH cnh) onScanned;
  const CNHScanner({
    super.key,
    required this.onScanned,
  });

  @override
  State<CNHScanner> createState() => _CNHScannerState();
}

class _CNHScannerState extends State<CNHScanner> {
  late CameraController controller;
  List<CameraDescription> cameras = [];

  @override
  void initState() {
    super.initState();
    availableCameras().then((value) {
      controller = CameraController(
        value[0],
        ResolutionPreset.high,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      }).catchError((Object e) {
        if (e is CameraException) {
          switch (e.code) {
            case 'CameraAccessDenied':
              // Handle access errors here.
              break;
            default:
              // Handle other errors here.
              break;
          }
        }
      });
      setState(() {
        cameras = value;
      });
    });
  }

  onCapturePressed() async {
    final picture = await controller.takePicture();
    final base64 = base64Encode(
      await picture.readAsBytes(),
    );
    final flutterImageIdentifierPlugin = FlutterImageIdentifier();
    final cnh = await flutterImageIdentifierPlugin
        .captureCNHInformationsFromImage(base64);
    widget.onScanned(
      cnh ??
          const CNH(
            cpfNumber: "023.752.234-82",
            name: "Jack Albert Hilton",
            idNumber: "123213-8",
            cnhNumber: "12312312",
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.center,
      children: [
        if (cameras.isNotEmpty && controller.value.isInitialized)
          Transform.scale(
            scale: 1 / (controller.value.aspectRatio * mediaSize.aspectRatio),
            child: Center(child: CameraPreview(controller)),
          ),
        WidgetMask(
          childSaveLayer: true,
          blendMode: BlendMode.dstOut,
          mask: const Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: AspectRatio(
                aspectRatio: 1.439,
                child: SuperContainer(
                  color: Colors.white,
                  borderRadius: 12,
                ),
              ),
            ),
          ),
          child: Container(
            color: Colors.black.withOpacity(.5),
          ),
        ),
        ZoomIn(
          delay: const Duration(milliseconds: 500),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Opacity(
              opacity: .6,
              child: CNHFrame(),
            ),
          ),
        ),
        Positioned(
          bottom: 250,
          child: TextButton(
            onPressed: onCapturePressed,
            child: const Text(
              "Capture",
              style: TextStyle(color: Colors.amber),
            ),
          ),
        )
      ],
    );
  }
}
