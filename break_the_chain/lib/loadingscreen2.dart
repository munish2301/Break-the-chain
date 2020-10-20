import 'package:flutter/material.dart';

class LoadingScreen2 extends StatefulWidget {
  static String loadingScreenId2 = "LoadingScreenId2";
  @override
  _LoadingScreen2State createState() => _LoadingScreen2State();
}

class _LoadingScreen2State extends State<LoadingScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      body: Center(),
    );
  }
}
