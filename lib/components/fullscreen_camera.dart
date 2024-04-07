import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class FullScreenCamera extends StatelessWidget {
  const FullScreenCamera({super.key, required this.controller});
  final CameraController controller;

  @override
  Widget build(BuildContext context) {
    final scale = 1 /
        (controller.value.aspectRatio *
            MediaQuery.of(context).size.aspectRatio);
    return Transform.scale(
      scale: scale,
      alignment: Alignment.topCenter,
      child: AspectRatio(
          aspectRatio: controller.value.previewSize!.height /
              controller.value.previewSize!.width,
          child: CameraPreview(controller)),
    );
  }
}
