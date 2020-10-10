import 'package:break_the_chain/loadingscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';
import 'loadingscreen.dart';

//Creating Homepage for our app!
class HomePage extends StatefulWidget {
  static String homepageId = "HomePage";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Colors.white,
                      child: Image(
                        image: AssetImage('images/playstore.png'),
                      ),
                    ),
                    Text(
                      "Break the chain !",
                      textAlign: TextAlign.center,
                      style: kHomePageTextStyle,
                    ),
                  ],
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                      child: RaisedButton(
                        color: Colors.teal[400],
                        focusColor: Colors.teal,
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Start",
                          style: kHomePageButtonStyle,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                      child: RaisedButton(
                        color: Colors.teal[400],
                        focusColor: Colors.teal,
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Get Covid Stats",
                          style: kHomePageButtonStyle,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                              context, LoadingScreen.loadingScreenId);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
