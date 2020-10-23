import 'package:break_the_chain/homepage.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quartet/quartet.dart';

import 'constants.dart';
import 'covid_data.dart';
import 'nointernet.dart';

CovidDataModel cm = CovidDataModel();

class CovidDataScreen extends StatefulWidget {
  final dynamic coviddata;
  CovidDataScreen({@required this.coviddata});
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
  void initState() {
    super.initState();
    updateUI(widget.coviddata);
  }

  void updateUI(dynamic mydata) {
    if (mydata == null) {
      numOfActive = 0;
      numOfDeaths = 0;
      numOfRecoveries = 0;
      numOfTotalCases = 0;
      return;
    }
    setState(() {
      bool isFine = ((state != null && district != null) &&
          (mydata.containsKey(state) == true) &&
          (mydata[state]['districtData'].containsKey(district) == true));
      if (isFine == false) {
        mydata = widget.coviddata;
        state = '---';
        district = '---';
      }
      numOfTotalCases = isFine
          ? mydata[state]['districtData'][district]['confirmed']
          : int.parse(mydata['cases_time_series'].last['totalconfirmed']);
      numOfRecoveries = isFine
          ? mydata[state]['districtData'][district]['recovered']
          : int.parse(mydata['cases_time_series'].last['totalrecovered']);
      numOfDeaths = isFine
          ? mydata[state]['districtData'][district]['deceased']
          : int.parse(mydata['cases_time_series'].last['totaldeceased']);
      numOfActive = isFine
          ? mydata[state]['districtData'][district]['active']
          : numOfTotalCases - numOfRecoveries - numOfDeaths;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pushNamed(HomePage.homepageId);
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Colors.teal[50],
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
                  decoration: BoxDecoration(
                    color: Colors.teal[50],
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: TextField(
                    controller: stateholder,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: Colors.teal[400]),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: Colors.teal, width: 2.0),
                      ),
                      fillColor: Colors.teal[400],
                      focusColor: Colors.teal,
                      hintText: 'Enter state here: ',
                      hintStyle:
                          TextStyle(color: Colors.teal[100], fontSize: 18.0),
                    ),
                    cursorColor: Colors.teal[400],
                    style: TextStyle(color: Colors.teal[400], fontSize: 18.0),
                    onChanged: (value) {
                      state = value;
                      state = titleCase(state.trim().toLowerCase());
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15.0),
                  margin: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.teal[50],
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: TextField(
                    controller: districtholder,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: Colors.teal[400]),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: Colors.teal, width: 2.0),
                      ),
                      fillColor: Colors.teal[400],
                      focusColor: Colors.teal,
                      hintText: 'Enter district here: ',
                      hintStyle:
                          TextStyle(color: Colors.teal[100], fontSize: 18.0),
                    ),
                    cursorColor: Colors.teal[400],
                    style: TextStyle(color: Colors.teal[400], fontSize: 18.0),
                    onChanged: (value) {
                      district = value;
                      district = titleCase(district.trim().toLowerCase());
                    },
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.all(15.0),
                  margin: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.teal),
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.teal[50],
                  ),
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
                            //flex: 4,
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
                                      state == null ? '---' : state,
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
                                      district == null ? '---' : district,
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
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Colors.teal[100],
                              ),
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
                                    "$numOfTotalCases",
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
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Colors.teal[100],
                              ),
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
                                    "$numOfActive",
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
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Colors.teal[100],
                              ),
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
                                    "$numOfRecoveries",
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
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Colors.teal[100],
                              ),
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
                                    "$numOfDeaths",
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
                        onPressed: () async {
                          bool result =
                              await DataConnectionChecker().hasConnection;
                          if (result == false) {
                            Navigator.pushNamed(
                                context, NoInternetScreen.noInternetScreenID);
                          } else {
                            if (state != null && district != null) {
                              var coviddata = await cm.getDistrictStat();
                              stateholder.clear();
                              districtholder.clear();
                              updateUI(coviddata);
                            }
                          }
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
