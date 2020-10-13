import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';
import 'loadingscreen.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print(e);
  }
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(cameras),
      routes: {
        HomePage.homepageId: (context) => HomePage(cameras),
        LoadingScreen.loadingScreenId: (context) => LoadingScreen(),
      },
    );
  }
}
