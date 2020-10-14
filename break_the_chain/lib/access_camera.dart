import 'dart:math' as math;

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

typedef void Callback(List<dynamic> list, int h, int w);

class SocialDistancingApp extends StatefulWidget {
  static String socialDistancingId = "socialdistancing_id";
  final List<CameraDescription> cams;
  final Callback setRecognitions;
  final String model;
  SocialDistancingApp(this.cams, this.model, this.setRecognitions);
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
    var tmp = MediaQuery.of(context).size;
    var screenH = math.max(tmp.height, tmp.width);
    var screenW = math.min(tmp.height, tmp.width);
    tmp = controller.value.previewSize;
    var previewH = math.max(tmp.height, tmp.width);
    var previewW = math.min(tmp.height, tmp.width);
    var screenRatio = screenH / screenW;
    var previewRatio = previewH / previewW;
    return Scaffold(
      body: OverflowBox(
        maxHeight: screenRatio > previewRatio
            ? screenH
            : screenW / previewW * previewH,
        maxWidth: screenRatio > previewRatio
            ? screenH / previewH * previewW
            : screenW,
        child: CameraPreview(controller),
      ),
    );
  }
}
