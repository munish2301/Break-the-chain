import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'news_data.dart';
import 'newsdatascreen.dart';
import 'nointernet.dart';

class LoadingScreen2 extends StatefulWidget {
  static String loadingScreenId2 = "LoadingScreenId2";
  @override
  _LoadingScreen2State createState() => _LoadingScreen2State();
}

class _LoadingScreen2State extends State<LoadingScreen2> {
  @override
  void initState() {
    super.initState();
    getnews();
  }

  void getnews() async {
    bool result = await DataConnectionChecker().hasConnection;
    if (result == false) {
      Navigator.pushNamed(context, NoInternetScreen.noInternetScreenID);
      return;
    }
    NewsDataModel nm = NewsDataModel();
    var data = await nm.getNews();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return NewsDataScreen(
            newsdata: data,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitDoubleBounce(
              color: Colors.teal[400],
              size: 100.0,
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Only I and You can Break the Chain!',
              style: TextStyle(color: Colors.teal),
            ),
          ],
        ),
      ),
    );
  }
}
