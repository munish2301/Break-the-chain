import 'package:flutter/material.dart';

import 'homepage.dart';
import 'loadingscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {
        HomePage.homepageId: (context) => HomePage(),
        LoadingScreen.loadingScreenId: (context) => LoadingScreen(),
      },
    );
  }
}
