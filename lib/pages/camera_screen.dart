import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  CameraScreen(this.cameras);

  @override
  CameraScreenState createState() {
    return new CameraScreenState();
  }
}

class CameraScreenState extends State<CameraScreen> {
  CameraController controller;

  @override
  void initState() {
    super.initState();
    controller =  new CameraController(widget.cameras[0], ResolutionPreset.high);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return new Container();
    }
    /*
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      //turns: AlwaysStoppedAnimation(270/360),
      child: new CameraPreview(controller),
    );*/
    return new RotationTransition(
      turns: AlwaysStoppedAnimation(270/360),
      child: new CameraPreview(controller),
    );

  }
}
