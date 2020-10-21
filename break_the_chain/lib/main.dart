import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';
import 'loadingscreen.dart';
import 'loadingscreen2.dart';
import 'nointernet.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'ElMessiri',
      ),
      home: HomePage(cameras),
      routes: {
        HomePage.homepageId: (context) => HomePage(cameras),
        LoadingScreen.loadingScreenId: (context) => LoadingScreen(),
        LoadingScreen2.loadingScreenId2: (context) => LoadingScreen2(),
        NoInternetScreen.noInternetScreenID: (context) => NoInternetScreen(),
      },
    );
  }
}
