import 'dart:io';

import 'package:flutter/material.dart';
import 'package:glam_switch_fe/components/custom_app_bar.dart';

class GlamSwitchLayout extends StatelessWidget {
  const GlamSwitchLayout({
    super.key,
    // required this.imagePath
  });
  // final File imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: SafeArea(
            child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 600, maxHeight: 600),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                // child: Image.asset("assets/images/face_example.jpg"),
                // child: Image.file(imagePath),
              ),
            ),
            DefaultTabController(
                length: 2,
                child: TabBar(
                  tabs: [
                    const Tab(text: "Male"),
                    const Tab(text: "Female"),
                    FilledButton.tonal(
                        onPressed: () {}, child: const Text("Next: Color"))
                  ],
                )),
          ],
        )));
  }
}
