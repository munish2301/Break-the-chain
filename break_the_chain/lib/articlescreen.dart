import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'constants.dart';

class ArticleScreen extends StatefulWidget {
  final String url;
  ArticleScreen({this.url});

  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
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
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.teal,
        title: Text(
          "Health News",
          style: kCovidDataTitleTextStyle,
        ),
      ),
      body: WillPopScope(
        onWillPop: () {
          Navigator.of(context).pop();
          return Future.value(false);
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: WebView(
            initialUrl: widget.url,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
          ),
        ),
      ),
    );
  }
}
