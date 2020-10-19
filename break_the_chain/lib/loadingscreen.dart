import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'covid_data.dart';
import 'coviddatascreen.dart';
import 'nointernet.dart';

class LoadingScreen extends StatefulWidget {
  static String loadingScreenId = "LoadingScreenId";
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getloc();
  }

  void getloc() async {
    bool result = await DataConnectionChecker().hasConnection;
    if (result == true) {
      CovidDataModel cm = CovidDataModel();
      var data = await cm.getIndiaStat();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return CovidDataScreen(
          coviddata: data,
        );
      }));
    } else {
      Navigator.pushNamed(context, NoInternetScreen.noInternetScreenID);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              style: TextStyle(fontFamily: 'Satisfy'),
            ),
          ],
        ),
      ),
    );
  }
}
