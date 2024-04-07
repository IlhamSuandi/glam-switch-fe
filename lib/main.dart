import 'package:camera/camera.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:glam_switch_fe/pages/camera.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  late CameraController controller;
  late List<CameraDescription> cameras;

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    controller = CameraController(
        cameras[EnumCameraDescription.back.index], ResolutionPreset.high,
        imageFormatGroup: ImageFormatGroup.jpeg, enableAudio: false);
    await controller.initialize();
  }

  runApp(DevicePreview(
      enabled: false,
      builder: (context) => FutureBuilder(
          future: initializeCamera(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return App(controller: controller);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }))));
}

class App extends StatelessWidget {
  const App({super.key, required this.controller});
  final CameraController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: CameraScreen(controller: controller),
      routes: {
        '/camera': (context) => CameraScreen(controller: controller),
      },
    );
  }
}

enum EnumCameraDescription { front, back }
