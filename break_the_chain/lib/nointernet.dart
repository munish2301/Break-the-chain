import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

class NoInternetScreen extends StatelessWidget {
  static final String noInternetScreenID = "noconnectionid";
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pushNamed(HomePage.homepageId);
        return Future.value(false);
      },
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: Text(
                "Please check your internet connection!",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
