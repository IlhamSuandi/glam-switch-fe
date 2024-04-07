import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:glam_switch_fe/components/camera_overlay.dart';
import 'package:glam_switch_fe/components/logo.dart';
import 'package:glam_switch_fe/pages/editing_picture.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key, required this.controller});

  final CameraController controller;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          // FullScreenCamera(controller: controller),
          SizedBox(
            width: size.width,
            height: size.height * 1,
            child: CameraPreview(controller),
          ),

          // CameraPreview(controller),
          CustomPaint(
            painter: CameraOverlay(
              screenWidth: MediaQuery.of(context).size.width,
              screenHeight: MediaQuery.of(context).size.height,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FilledButton.tonal(
                          onPressed: () {},
                          child: const Column(
                            children: [
                              Text("Look Straight"),
                              Text("Good"),
                            ],
                          )),
                      FilledButton.tonal(
                          onPressed: () {},
                          child: const Column(
                            children: [
                              Text("Lighting"),
                              Text("Ok"),
                            ],
                          )),
                      FilledButton.tonal(
                          onPressed: () {},
                          child: const Column(
                            children: [
                              Text("Face Position"),
                              Text("Not Good"),
                            ],
                          ))
                    ]),
              ],
            ),
          ),
          Positioned(
            bottom: size.height / 3.5,
            child: const Text(
              "Hold on while we capture your image",
              style: TextStyle(color: Colors.white),
            ),
          ),
          // Positioned(bottom: size.height / 6, child: const )
          Positioned(
            bottom: size.height / 6,
            child: const Logo(
              variant: EnumLogoVariant.secondary,
            ),
          ),

          Positioned(
            bottom: 0,
            child: FloatingActionButton(
              // Provide an onPressed callback.
              onPressed: () async {
                // Take the Picture in a try / catch block. If anything goes wrong,
                // catch the error.
                try {
                  // Ensure that the camera is initialized.
                  // await controller.initialize();

                  // Attempt to take a picture and get the file `image`
                  // where it was saved.
                  // final image = await controller.takePicture();

                  // // 1. read the image from disk into memory
                  // final file = File(image.path);
                  // Uint8List? imageBytes = await file.readAsBytes();

                  // // // 2. flip the image on the X axis
                  // final ImageEditorOption option = ImageEditorOption();
                  // option.addOption(const FlipOption(horizontal: true));
                  // imageBytes = await ImageEditor.editImage(
                  //     image: imageBytes, imageEditorOption: option);

                  // // 3. write the image back to disk
                  // await file.delete();

                  // await file.writeAsBytes(imageBytes as List<int>);

                  // // GallerySaver.saveImage(image.path);

                  // if (!context.mounted) return;

                  // If the picture was taken, display it on a new screen.
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => GlamSwitchLayout(
                          // Pass the automatically generated path to
                          // the DisplayPictureScreen widget.
                          // imagePath: file,
                          ),
                    ),
                  );
                } catch (e) {
                  // If an error occurs, log the error to the console.
                  print(e);
                }
              },
              child: const Icon(Icons.camera_alt),
            ),
          )
        ],
      ),
    );
  }
}
