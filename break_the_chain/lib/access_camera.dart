import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class SocialDistancingApp extends StatefulWidget {
  static String socialDistancingId = "socialdistancing_id";
  final List<CameraDescription> cams;
  SocialDistancingApp(this.cams);
  @override
  _SocialDistancingAppState createState() => _SocialDistancingAppState();
}

class _SocialDistancingAppState extends State<SocialDistancingApp> {
  CameraController controller;

  @override
  void initState() {
    super.initState();

    controller = CameraController(widget.cams[0], ResolutionPreset.high);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      body: OverflowBox(
        child: CameraPreview(controller),
      ),
    );
  }
}
