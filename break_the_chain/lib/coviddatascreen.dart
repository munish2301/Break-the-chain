import 'package:break_the_chain/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class CovidDataScreen extends StatefulWidget {
  @override
  _CovidDataScreenState createState() => _CovidDataScreenState();
}

class _CovidDataScreenState extends State<CovidDataScreen> {
  final stateholder = TextEditingController();
  final districtholder = TextEditingController();
  String state;
  String district;
  int numOfActive;
  int numOfDeaths;
  int numOfRecoveries;
  int numOfTotalCases;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          iconSize: 35.0,
          onPressed: () {
            Navigator.pushNamed(context, HomePage.homepageId);
          },
        ),
        backgroundColor: Colors.teal,
        title: Text(
          "India Covid-19 Stats",
          style: kCovidDataTitleTextStyle,
        ),
      ),
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15.0),
                margin: EdgeInsets.all(15.0),
                child: TextField(
                  controller: stateholder,
                  cursorColor: Colors.teal[400],
                  style: TextStyle(color: Colors.teal[400], fontSize: 18.0),
                  onChanged: (value) {
                    state = value;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(15.0),
                margin: EdgeInsets.all(15.0),
                child: TextField(
                  controller: districtholder,
                  cursorColor: Colors.teal[400],
                  style: TextStyle(color: Colors.teal[400], fontSize: 18.0),
                  onChanged: (value) {
                    district = value;
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.all(15.0),
                margin: EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          //flex: 3,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 15.0),
                            height: 80.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Country",
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.w800),
                                ),
                                Text(
                                  "India",
                                  style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 15.0),
                            height: 80.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "State",
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.w800),
                                ),
                                FittedBox(
                                  child: Text(
                                    "Punjab",
                                    style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  fit: BoxFit.scaleDown,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          //flex: 3,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                            height: 80.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "District",
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.w800),
                                ),
                                FittedBox(
                                  child: Text(
                                    "Bathinda",
                                    style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  fit: BoxFit.scaleDown,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 15.0),
                            height: 80.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Confirmed",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w800),
                                ),
                                Text(
                                  "1234567",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                            height: 80.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Active",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w800),
                                ),
                                Text(
                                  "123456",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0),
                            height: 80.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Recovered",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w800),
                                ),
                                Text(
                                  "1234567",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                            height: 80.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Deceased",
                                  style: TextStyle(
                                      color: Colors.black26,
                                      fontWeight: FontWeight.w800),
                                ),
                                Text(
                                  "12345",
                                  style: TextStyle(
                                    color: Colors.black26,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsets.all(20.0),
                    child: RaisedButton(
                      padding: EdgeInsets.all(18.0),
                      color: Colors.teal[400],
                      focusColor: Colors.teal,
                      child: Text(
                        'Check Stats',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
