import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'homepage.dart';
import 'news_data.dart';
import 'newstile.dart';

NewsDataModel nm = NewsDataModel();

class NewsDataScreen extends StatefulWidget {
  final dynamic newsdata;
  NewsDataScreen({@required this.newsdata});
  @override
  _NewsDataScreenState createState() => _NewsDataScreenState();
}

class _NewsDataScreenState extends State<NewsDataScreen> {
  dynamic newsArticles;
  @override
  void initState() {
    super.initState();
    updateUI(widget.newsdata);
  }

  void updateUI(dynamic mydata) {
    if (mydata == null) {
      newsArticles = {};
    } else {
      setState(() {
        newsArticles = mydata;
      });
    }
  }

  Future<bool> refreshListView() async {
    dynamic newsData = await nm.getNews();
    updateUI(newsData);
    return true;
  }

  List<Widget> getListTiles(dynamic articles) {
    List<Widget> newsTiles = [];
    for (var article in articles) {
      newsTiles.add(
        Container(
          color: Colors.teal[50],
          child: Container(
            padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
            margin: EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 5.0),
            decoration: BoxDecoration(
              color: Colors.teal[100],
              borderRadius: BorderRadius.circular(6.0),
              boxShadow: [
                BoxShadow(color: Colors.teal, blurRadius: 0.5),
              ],
            ),
            child: NewsTile(
              url: article["url"],
              urlToImage: article["urlToImage"],
              title: article["title"],
              description: article["description"],
            ),
          ),
        ),
      );
    }
    return newsTiles;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pushNamed(HomePage.homepageId);
        return Future.value(false);
      },
      child: Scaffold(
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
            "Health News",
            style: kCovidDataTitleTextStyle,
          ),
        ),
        body: SafeArea(
          child: Container(
            child: RefreshIndicator(
              child: ListView(
                children: getListTiles(newsArticles),
              ),
              onRefresh: refreshListView,
              backgroundColor: Colors.teal[50],
              color: Colors.teal,
            ),
          ),
        ),
      ),
    );
  }
}
