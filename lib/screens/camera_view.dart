import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
List<CameraDescription> cameras;
class CameraView extends StatefulWidget {
  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView>  {
  List<CameraDescription> cameras;
  CameraController controller;
  bool isReady = false;

  @override
  void initState() {
    super.initState();
    setupCameras();
  }

  Future<void> setupCameras() async {
    try {
      cameras = await availableCameras();
      controller = new CameraController(cameras[0], ResolutionPreset.medium);
      await controller.initialize();
    } on CameraException catch (_) {
      setState(() {
        isReady = false;
      });
    }
    setState(() {
      isReady = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(!controller.value.isInitialized) {
      return Container();
    }
    else {
      return AspectRatio(
        aspectRatio: 1.6,
        //controller.value.aspectRatio,
        child: CameraPreview(controller),
      );
    }
    
  }
}
